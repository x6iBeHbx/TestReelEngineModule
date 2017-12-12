package reelEngine3.interfaces;
/**
 * @author Andrii Andriushchenko
 */
interface IOverlapChecker<T:IGeometry> 
{
	public var reelGeometry(null, default):T;

	public function check(viewPort:IViewPort<T>):Void;
	
	private function set_reelGeometry(value:T):Void;
}