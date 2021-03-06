package reelEngine3.interfaces;
import reelEngine3.common.Transform;
import reelEngine3.common.VerticalOverlapReport;

/**
 * @author Andrii Andriushchenko
 */
interface IViewPort<T:IGeometry> 
{
	public var transform(default, default):Transform;
	public var geometry(default, default):T;
	public var worldGeometry(default, default):T;
	public var overlapReport(default, default):VerticalOverlapReport;
	
	public function enteringItem(item:IReelItem<T>):Bool;
	
	private function set_transform(value:Transform):Void;
	private function set_geometry(value:T):Void;
	private function set_worldGeometry(value:T):Void;
	private function set_overlapReport(value:VerticalOverlapReport):Void;
	
	private function get_transform():Transform;
	private function get_geometry():T;
	private function get_worldGeometry():T; 
	private function get_overlapReport():VerticalOverlapReport; 
}