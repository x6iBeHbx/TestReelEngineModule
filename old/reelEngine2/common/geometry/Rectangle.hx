package reelEngine2.common.geometry;

import reelEngine3.interfaces.IGeometry;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Rectangle implements IGeometry//extends openfl.geom.Rectangle implements IGeometry 
{
	public function new(x:Int = 0, y:Int = 0, width:Int = 0, height:Int = 0){
		this.height = height;
		this.width = width;
		this.x = x;
		this.y = y;
		
		//super(x, y, width, height);
	};
	
	public var width:Int;
	public var height:Int;
	public var x:Int;
	public var y:Int;
	
	public function intersects (toIntersect:Rectangle):Bool {
		
		var x0 = x < toIntersect.x ? toIntersect.x : x;
		var x1 = x + width > toIntersect.x + toIntersect.width ? toIntersect.x + toIntersect.width : x + width;
		
		if (x1 <= x0) {
			return false;
		}
		
		var y0 = y < toIntersect.y ? toIntersect.y : y;
		var y1 = y + height > toIntersect.y + toIntersect.height ? toIntersect.y + toIntersect.height : y + height;
		
		return y1 > y0;
		
	}
}