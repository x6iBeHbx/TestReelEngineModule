package reelEngine2.common;

import reelEngine2.common.geometry.Rectangle;
import reelEngine2.common.geometry.Transform;
import reelEngine3.interfaces.IGeometry;
import reelEngine2.interfaces.IGeometryCirculator;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class VerticalGeometryCirculator implements IGeometryCirculator<Rectangle> 
{
	public var baseGeometry(default, default):Rectangle;
	
	public function new() 
	{
		
	}
	
	public function circulate(transform:Transform):Void 
	{
		if (transform.y >= (baseGeometry.y + baseGeometry.height) || transform.y < baseGeometry.y)
		{
			transform.y = Std.int((baseGeometry.y + baseGeometry.height) + transform.y);
		}
	}
		
	private function get_baseGeometry():Rectangle 
	{
		return baseGeometry;
	}
	
	private function set_baseGeometry(value:Rectangle):Void 
	{
		baseGeometry = value;
	}
}