package reelEngine3.common;

import reelEngine3.interfaces.IGeometryCirculator;
import reelEngine3.interfaces.IMovementRule;
import reelEngine3.interfaces.IOverlapChecker;
import reelEngine3.interfaces.IPlacementRule;
import reelEngine3.interfaces.IReel;
import reelEngine3.interfaces.IReelItem;
import reelEngine3.interfaces.IViewPort;
import utils.DCCList;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Reel implements IReel<Rectangle> 
{
	public var pointer:Transform;
	public var geometry(default, default):Rectangle;
	public var movementRule:IMovementRule;
	public var geometryCirculator:IGeometryCirculator<Rectangle>;
	public var placementRule:IPlacementRule<Rectangle>;
	public var viewPort:IViewPort<Rectangle>;
	public var overlapChecker:IOverlapChecker<Rectangle>;
	
	private var items:DCCList<IReelItem<Rectangle>>;
	private var headItem:IReelItem<Rectangle>;
	private var tailItem:IReelItem<Rectangle>;
	
	public function new(items:DCCList<IReelItem<Rectangle>>) 
	{
		this.items = items;
		pointer = new Transform();
	}
	
	public function init(movementRule:IMovementRule, 
							geometryCirculator:IGeometryCirculator<Rectangle>,
							placementRule:IPlacementRule<Rectangle>,
							viewPort:IViewPort<Rectangle>,
							overlapChecker:IOverlapChecker<Rectangle>)
	{
		this.movementRule = movementRule;
		this.geometryCirculator = geometryCirculator;
		this.placementRule = placementRule;
		this.viewPort = viewPort;
		this.overlapChecker = overlapChecker;
		
		placementItems();
		randomize();
		
		pointer.y = headItem.transform.y;
		pointer.x = headItem.transform.x;
		
		findTailOnStart();
	}
	
	private function placementItems():Void
	{
		geometry = placementRule.apply(items);
		
		geometryCirculator.baseGeometry = geometry;
		overlapChecker.reelGeometry = geometry;
		viewPort.overlapReport = new VerticalOverlapReport();
		viewPort.overlapReport.reelGeometry = geometry;
	}
	
	private function findTailOnStart():Void
	{
		while (viewPort.enteringItem(items.nextElement(tailItem)))
		{
			tailItem = items.nextElement(tailItem);
		}
		
		trace('Tail found on start it ${tailItem.geometry.y}');
	}
	
	public function randomize():Void
	{
		//temp 
		headItem = tailItem = items.elementByIndex(0);//(Std.int(Math.random() * items.length));
		
		viewPort.worldGeometry.y = headItem.geometry.y;
		trace('Head found on start it ${headItem.geometry.y}');
	}
	
	public function update(frameTime:Int):Void 
	{
		movementRule.apply(pointer, frameTime);
		geometryCirculator.circulate(pointer);
	}
	
	public function reportVisibleItems():Void 
	{
		viewPort.transform.y = viewPort.worldGeometry.y = pointer.y;
		viewPort.transform.x = viewPort.worldGeometry.x = pointer.x;
		
		overlapChecker.check(viewPort);
		
		if (viewPort.overlapReport.isOverlap)
		{
			findHeadItem();
			viewPort.worldGeometry.y = -(viewPort.overlapReport.reelGeometry.height - viewPort.worldGeometry.y);
			findTailItem();
			viewPort.worldGeometry.y = viewPort.transform.y;
		}
		else
		{
			findHeadItem();
			findTailItem();
		}
		
		trace('Head found after spin it ${headItem.geometry.y}');
		trace('Tail found after spin it ${tailItem.geometry.y}');
	}
	
	private function findHeadItem():Void
	{
		while (viewPort.enteringItem(items.prevElement(headItem)))
		{
			headItem = items.prevElement(headItem);
		}
	}
	
	private function findTailItem():Void
	{
		while (!viewPort.enteringItem(items.prevElement(tailItem)))
		{
			tailItem = items.prevElement(tailItem);
		}
	}
	
	function set_geometry(value:Rectangle):Void 
	{
		geometry = value;
	}
	
	function get_geometry():Rectangle 
	{
		return geometry;
	}
}