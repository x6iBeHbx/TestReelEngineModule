package;

import openfl.display.Sprite;
import openfl.Lib;
import reelEngine3.common.MovementRule;
import reelEngine3.common.PlacementRules;
import reelEngine3.common.Rectangle;
import reelEngine3.common.RectangleReelItem;
import reelEngine3.common.Reel;
import reelEngine3.common.Transform;
import reelEngine3.common.VeriticalViewPort;
import reelEngine3.common.VerticalGeometryCirculator;
import reelEngine3.common.VerticalOverlapChecker;
import reelEngine3.interfaces.IReelItem;
import starling.display.Image;
import starling.display.Quad;
import utils.DCCList;

/**
 * ...
 * @author Andrii Andriushchenko
 */

class Main extends Sprite
{

	public function new()
	{
		super();

		var r1 = new Rectangle(0, 0, 100, 100);
		var r2 = new Rectangle(0, 50, 100, 100);
		
		trace(r1.intersects(r2));
		
		
		var iconList = new DCCList<IReelItem<Rectangle>>();

		for(i in 0...50){
			var icon = new RectangleReelItem();
			icon.geometry = new Rectangle(0,0,100, 100);
			icon.transform = new Transform();
			iconList.add(icon);
		}
		
		
		var reel = new Reel(iconList);
		
		var viewPort = new VeriticalViewPort();
		viewPort.transform = new Transform();
		viewPort.geometry = new Rectangle(0, 0, 100, 300);
		viewPort.worldGeometry = new Rectangle(0,0,100,300);
		
		reel.init(new MovementRule(50), new VerticalGeometryCirculator(), new PlacementRules(), viewPort, new VerticalOverlapChecker());
		
		for(i in 0...101){
			reel.update(1);
		}
		
		reel.reportVisibleItems();
		
		trace(reel.pointer.y);
	}

	/*public function test1(){

		var colors = [0xFF0000, 0x00FF00, 0x0000FF, 0xFFFF00, 0x00FFFF];
		var iconList = new DCCList<IIcon>();

		for(i in 0...50){
			var icon = new Icon();
			icon.geometry = new Geometry(100, 100);
			icon.transform = new Transform();

			icon.id = cast(Math.random() * 5, Int);
			var q = new Quad(100,100, colors[icon.id]);
			icon.imageTemp = q;
			iconList.add(icon);
		}

		var viewPort = new ReelViewPort();
		viewPort.transform = new Transform();
		viewPort.geometry = new Geometry(300, 100);
		viewPort.transform.y = 4700;

		var reel = new Reel(iconList,
		null,
		new RuleMoveReelUpToDown(10),
		new ClassicIconPositioningRule(),
		viewPort);

		for(k in 0...495){
			reel.move(1);
		}
	}*/
}

