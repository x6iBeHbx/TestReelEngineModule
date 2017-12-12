package reelEngine3.interfaces;
import reelEngine3.common.Transform;

/**
 * @author Andrii Andriushchenko
 */
interface IReelItem<T:IGeometry>
{
	public var transform(default, default):Transform;
	
	public var geometry(default, default):T;
	public var renderGeometry(default, default):T;
	
	private function set_transform(value:Transform):Void;
	private function set_geometry(value:T):Void;
	private function set_renderGeometry(value:T):Void;
	
	private function get_transform():Transform;
	private function get_geometry():T;
	private function get_renderGeometry():T;
}