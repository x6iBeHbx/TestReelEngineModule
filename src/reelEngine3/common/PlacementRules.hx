package reelEngine3.common;

import reelEngine3.interfaces.IPlacementRule;
import reelEngine3.interfaces.IReelItem;
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
			item.transform.y = item.geometry.y = y;
			y += Std.int(item.geometry.height);
		}
		
		var width = items.lastElement().geometry.width;
		var height = items.lastElement().transform.y + items.lastElement().geometry.height;
		
		var rectangle:Rectangle = new Rectangle(0, 0, width, height);
		
		return rectangle;
	}
}