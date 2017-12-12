package reelEngine3.common;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class VerticalOverlapReport
{
	public var isOverlap:Bool;
	public var reelGeometry(default, default):Rectangle;
	
	public function new() 
	{
	}
	
	private function set_reelGeometry(value:Rectangle):Void
	{
		reelGeometry = value;
	}
	
	private function get_reelGeometry():Rectangle
	{
		return reelGeometry;
	}
}