package reelEngine3.common;
import reelEngine3.interfaces.IOverlapChecker;
import reelEngine3.interfaces.IViewPort;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class VerticalOverlapChecker implements IOverlapChecker<Rectangle>
{
	public var reelGeometry(null, default):Rectangle;
	
	public function new() 
	{
	}
	
	public function check(viewPort:IViewPort<Rectangle>):Void 
	{
		//TODO need create checking to up and down side 
		
		if (viewPort.worldGeometry.y < reelGeometry.height && (viewPort.worldGeometry.y + viewPort.worldGeometry.height) > reelGeometry.height )
		{
			viewPort.overlapReport.isOverlap = true;
		}
		else
		{
			viewPort.overlapReport.isOverlap = false;
		}
	}
	
	private function set_reelGeometry(value:Rectangle):Void 
	{
		reelGeometry = value;
	}
}