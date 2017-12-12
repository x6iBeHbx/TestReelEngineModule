package reelEngine2.common.reels;
import reelEngine2.common.VerticalGeometryCirculator;
import reelEngine2.common.VerticalOverlapChecker;
import reelEngine2.common.VerticalOverlapReport;
import reelEngine2.common.geometry.Rectangle;
import reelEngine2.common.rules.MovementRule;
import reelEngine2.common.rules.PlacementRules;
import reelEngine3.interfaces.IGeometry;
import reelEngine2.interfaces.IOverlapChecker;
import reelEngine2.interfaces.IGeometryCirculator;
import reelEngine2.interfaces.IPlacementRule;
import reelEngine2.interfaces.IMovementRule;
import reelEngine2.interfaces.IReelItem;
import reelEngine2.interfaces.IViewPort;
import utils.DCCList;

import reelEngine2.common.geometry.Transform;
import reelEngine2.interfaces.IReel;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Reel implements IReel<Rectangle> 
{
	public var pointer:Transform;
	public var geometry(default, default):Rectangle;
		
	public var viewPort:IViewPort<Rectangle>;
	public var placementRule:IPlacementRule<Rectangle>;
	public var movementRule:IMovementRule;
	public var geometryCirculator:IGeometryCirculator<Rectangle>;
	public var overlapChecker:IOverlapChecker<Rectangle>;
	
	private var items:DCCList<IReelItem<Rectangle>>;
	private var headItem:IReelItem<Rectangle>;
	private var tailItem:IReelItem<Rectangle>;
	
	public function new(items:DCCList<IReelItem<Rectangle>>) 
	{
		this.items = items;
		pointer = new Transform();
	}
	
	public function init(viewPort:VeriticalViewPort, 
							placementRule:PlacementRules, 
							movementRule:IMovementRule, 
							geometryCirculator:IGeometryCirculator<Rectangle>,
							overlapChecker:IOverlapChecker<Rectangle>):Void
	{
		this.viewPort = viewPort;
		this.placementRule = placementRule;
		this.movementRule = movementRule;
		this.geometryCirculator = geometryCirculator;
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
		viewPort.overlapReport.reelGeometry = geometry;
	}
	
	private function findTailOnStart():Void
	{
		while (viewPort.enteringItem(items.nextElement(headItem)))
		{
			tailItem = items.nextElement(headItem);
		}
	}
	
	public function randomize():Void
	{
		//temp 
		headItem = items.elementByIndex(Std.int(Math.random() * items.length));
	}

	
	public function update(frameTime:Int) 
	{
		movementRule.apply(pointer, frameTime);
		geometryCirculator.circulate(pointer);
	}
	
	public function reportVisibleItems(report:VerticalOverlapReport) 
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
	
	private function set_geometry(value:Rectangle):Void
	{
		geometry = value;
	}
	
	private function get_geometry():Rectangle
	{
		return geometry;
	}
}