package reelEngine3.common;

import reelEngine3.interfaces.IGeometry;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Rectangle implements IGeometry
{	
	public var width:Int;
	public var height:Int;
	public var x:Int;
	public var y:Int;
	
	public function new(x:Int = 0, y:Int = 0, width:Int = 0, height:Int = 0){
		this.height = height;
		this.width = width;
		this.x = x;
		this.y = y;
	};

	public function intersects (toIntersect:IGeometry):Bool {
		
		var result:Bool = false;
		switch(Type.getClass(toIntersect)){
			case Rectangle:
				
				var _toIntersect:Rectangle = cast(toIntersect, Rectangle);
				var x0 = x < _toIntersect.x ? _toIntersect.x : x;
				var x1 = x + width > _toIntersect.x + _toIntersect.width ? _toIntersect.x + _toIntersect.width : x + width;
				
				if (x1 <= x0) {
					result = false;
				}
				
				var y0 = y < _toIntersect.y ? _toIntersect.y : y;
				var y1 = y + height > _toIntersect.y + _toIntersect.height ? _toIntersect.y + _toIntersect.height : y + height;
				
				result = y1 > y0;
		}
		
		return result;
	}
}	
