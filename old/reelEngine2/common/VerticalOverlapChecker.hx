package reelEngine2.common;
import reelEngine2.common.geometry.Rectangle;
import reelEngine2.common.reels.VeriticalViewPort;
import reelEngine2.interfaces.IViewPort;

import reelEngine3.interfaces.IGeometry;
import reelEngine2.interfaces.IOverlapChecker;

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
	
	public function check(viewPort:VeriticalViewPort):Void 
	{
		//TODO need create checking to up and down side 
		
		if (viewPort.worldGeometry.y < reelGeometry.y && (viewPort.worldGeometry.y + viewPort.worldGeometry.height) < reelGeometry.height )
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