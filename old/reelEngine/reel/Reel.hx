package reelEngine.reel;

import lime.project.Icon;
import reelEngine.geometry.Geometry;
import reelEngine.geometry.Transform;
import reelEngine.intefaces.IGeometry;
import reelEngine.intefaces.IIcon;
import reelEngine.intefaces.IMovementRules;
import reelEngine.intefaces.IReel;
import reelEngine.intefaces.ITransform;
import reelEngine.intefaces.IViewPort;
import reelEngine.movementRules.rulesForViewPort.RuleMoveReelUpToDown;
import reelEngine.viewPort.ReelViewPort;
import utils.DCCList;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Reel implements IReel
{
	/* INTERFACE reelEngine.intefaces.IReel */

	public var viewPort:IViewPort;
	public var moveRule:IMovementRules;
	public var positionIconsRule:IPositioningRule;
	public var iconsList:DCCList<IIcon>;

	public var headItem:IIcon;
	public var tailItem:IIcon;
	
	public var transform:ITransform;
	public var geometry:IGeometry;
	
	public function new(iconsList:DCCList<IIcon>,
						startIcon:IIcon,
						moveRule:IMovementRules, 
						positionIconsRule:IPositioningRule, 
						viewPort:IViewPort)
	{
		this.iconsList = iconsList;
		this.moveRule = moveRule;
		this.positionIconsRule = positionIconsRule;
		this.viewPort = viewPort;
		
		initIconList();
		initViewPort();
	}
	
	private function initViewPort()
	{
		//TODO: Need add logic whan random give icon on boarder
		
		var tempList = new DCCList<IIcon>();
		for (item in iconsList)
		{
			if (viewPort.isEnterToViewPort(item))
			{
				tempList.add(item);
			}
		}
		
		headItem = tempList.firstElement();
		tailItem = tempList.lastElement();
		
		tempList.clear();
	}
	
	public function move(frameTime:Int):Void
	{
		moveRule.update(viewPort.transform, frameTime);
		analyze();
	}
	
	public function analyze():Void
	{
		if (-viewPort.transform.y >= viewPort.geometry.height)
		{
			viewPort.transform.y = (iconsList.lastElement().transform.y + iconsList.lastElement().geometry.height) + viewPort.transform.y;
			//initViewPort(); // temp =)))
		}
		
		while (viewPort.isEnterToViewPort(iconsList.prevElement(headItem)))
		{
			headItem = iconsList.prevElement(headItem);
		}
		
		while (!viewPort.isEnterToViewPort(tailItem))
		{
			tailItem = iconsList.prevElement(tailItem);
		}
		
		//temp desition
		if (viewPort.transform.y < 0)
		{
			var temp = new ReelViewPort();
			temp.transform = new Transform();
			temp.geometry = new Geometry(0,0);
			
			temp.transform.y = (iconsList.lastElement().transform.y + iconsList.lastElement().geometry.height) + viewPort.transform.y;
			temp.geometry.height = -viewPort.transform.y;
			
			while (temp.isEnterToViewPort(iconsList.prevElement(headItem)))
			{
				headItem = iconsList.prevElement(headItem);
			}
			
			temp = null;
		}
	}
	
	private function initIconList():Void
	{
		var iterator = 0;
		for (item in iconsList)
		{
			positionIconsRule.applyRule(item.transform, item.geometry, iterator);
			iterator++;
			trace('ID ${item.id} Y ${item.transform.y}');
		}
	}
}

/**
 * TODO: need move this to packege, it's temp place
 */
interface IPositioningRule
{
	public function applyRule(transform:ITransform, geometry:IGeometry, iterator:Int):Void;
}

class ClassicIconPositioningRule implements IPositioningRule
{
	public function new(){};
	public function applyRule(transform:ITransform, geometry:IGeometry, iterator:Int):Void
	{
		transform.y += geometry.height * iterator;
	}
}
