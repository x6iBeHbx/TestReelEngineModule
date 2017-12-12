package reelEngine2.common.rules;

import reelEngine2.common.geometry.Rectangle;
import reelEngine2.common.reels.RectangleReelItem;
import reelEngine3.interfaces.IGeometry;
import reelEngine2.interfaces.IPlacementRule;
import reelEngine2.interfaces.IReelItem;
import utils.DCCList;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class PlacementRules implements IPlacementRule<Rectangle>
{

	public function new() 
	{
		
	}
	
	
	public function apply(items:DCCList<IReelItem<Rectangle>>):Rectangle
	{
		var y = 0;
		for (item in items)
		{
			item.transform.y = y;
			y += Std.int(item.geometry.y);
		}
		
		var width = items.lastElement().geometry.width;
		var height = items.lastElement().transform.y + items.lastElement().geometry.height;
		
		var rectangle:Rectangle = new Rectangle(0, 0, width, height);
		
		return rectangle;
	}
}