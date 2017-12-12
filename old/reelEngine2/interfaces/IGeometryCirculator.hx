package reelEngine2.interfaces;
import reelEngine2.common.geometry.Transform;
import reelEngine3.interfaces.IGeometry;

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