package reelEngine2.interfaces;
import reelEngine2.common.VerticalOverlapReport;
import reelEngine2.common.geometry.Transform;
import reelEngine3.interfaces.IGeometry;

/**
 * @author Andrii Andriushchenko and Mykola Kamenyk
 */
interface IReel<T:IGeometry> extends IUpdateble
{
	public var pointer:Transform; 
	public var viewPort:IViewPort<T>;
	public var movementRule:IMovementRule;
	public var placementRule:IPlacementRule<T>;	
	public var geometryCirculator:IGeometryCirculator<T>;
	public var overlapChecker:IOverlapChecker<T>;
	
	public var geometry(default, default):T;

	public function reportVisibleItems(report:VerticalOverlapReport):Void;
	
	private function set_geometry(value:T):Void;
	private function get_geometry():T;
}