package reelEngine3.interfaces;
import reelEngine3.common.Transform;

/**
 * @author Andrii Andriushchenko
 */
interface IGeometryCirculator<T:IGeometry> 
{
	public var baseGeometry(default, default):T;
	
	public function circulate(transform:Transform):Void;
	
	private function set_baseGeometry(value:T):Void;	
	private function get_baseGeometry():T;
}