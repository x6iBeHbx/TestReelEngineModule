package reelEngine.intefaces;
import openfl.display.Bitmap;
import utils.DCCList;

/**
 * @author Andrii Andriushchenko
 */
interface IViewPort 
{
	public var transform:ITransform;
	public var geometry:IGeometry;
	
	public function isEnterToViewPort(item:IIcon):Bool;
}