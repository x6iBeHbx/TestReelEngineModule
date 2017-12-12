package reelEngine.intefaces;
import starling.display.Image;

/**
 * @author Andrii Andriushchenko
 */
interface IIcon 
{
	public var transform:ITransform;
	public var geometry:IGeometry;
	
	public var id:Int;
	public var image:Image;
}