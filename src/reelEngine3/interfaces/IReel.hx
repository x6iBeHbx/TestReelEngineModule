package reelEngine3.interfaces;
import reelEngine3.common.Transform;
import utils.DCCList;

/**
 * @author Andrii Andriushchenko and Mykola Kamenyk
 */
interface IReel<T:IGeometry> extends IUpdateble
{
	public var pointer:Transform; 
	public var geometry(default, default):T;
	public var movementRule:IMovementRule;
	public var geometryCirculator:IGeometryCirculator<T>;
	public var placementRule:IPlacementRule<T>;	
	public var overlapChecker:IOverlapChecker<T>;
	public var viewPort:IViewPort<T>;
	
	private var items:DCCList<IReelItem<T>>;

	public function reportVisibleItems():Void;
	
	private function set_geometry(value:T):Void;
	private function get_geometry():T;
}