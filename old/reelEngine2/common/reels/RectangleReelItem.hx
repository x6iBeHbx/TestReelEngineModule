package reelEngine2.common.reels;
import reelEngine2.common.geometry.Rectangle;
import reelEngine3.interfaces.IGeometry;
import reelEngine2.common.geometry.Transform;
import reelEngine2.interfaces.IReelItem;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class RectangleReelItem implements IReelItem<Rectangle>
{
	public var transform(default, default):Transform;
	
	public var geometry(default, default):Rectangle;
	
	public var renderGeometry(default, default):Rectangle;
	
	public function new() 
	{
		
	}

	//SETTERS
	function set_transform(value:Transform):Void 
	{
		transform = value;
	}
	
	function set_geometry(value:Rectangle):Void 
	{
		geometry = value;
	}
	
	function set_renderGeometry(value:Rectangle):Void 
	{
		renderGeometry = value;
	}
	
	//GETTERS
	function get_transform():Transform 
	{
		return transform;
	}
	
	function get_geometry():Rectangle 
	{
		return geometry;
	}
	
	function get_renderGeometry():Rectangle
	{
		return renderGeometry;
	}
}