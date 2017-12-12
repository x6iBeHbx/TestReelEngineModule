package reelEngine2.common.reels;
import reelEngine2.common.geometry.Rectangle;
import reelEngine2.interfaces.IReelItem;
import reelEngine2.common.VerticalOverlapReport;
import reelEngine3.interfaces.IGeometry;
import reelEngine2.interfaces.IViewPort;

import reelEngine.geometry.Transform;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class VeriticalViewPort implements IViewPort<Rectangle> 
{
	public var transform(default, default):Transform;
	public var geometry(default, default):Rectangle;
	public var worldGeometry(default, default):Rectangle;
	public var overlapReport(default, default):VerticalOverlapReport;
	
	public function new() 
	{
	}
	
	public function enteringItem(item:IReelItem<Rectangle>):Bool 
	{
		return worldGeometry.intersects(item.geometry);
	}
	
	function set_transform(value:Transform):Void 
	{
		transform = value;
	}
	
	function set_geometry(value:Rectangle):Void 
	{
		geometry = value;
	}
	
	function set_worldGeometry(value:Rectangle):Void 
	{
		worldGeometry = value;
	}
	
	function set_overlapReport(value:VerticalOverlapReport):Void 
	{
		overlapReport = value;
	}
	
	function get_transform():Transform 
	{
		return transform;
	}
	
	function get_geometry():Rectangle 
	{
		return geometry;
	}
	
	function get_worldGeometry():Rectangle
	{
		return worldGeometry;
	}
	
	function get_overlapReport():VerticalOverlapReport
	{
		return overlapReport;
	}
	
}