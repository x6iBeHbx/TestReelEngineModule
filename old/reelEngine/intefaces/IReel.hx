package reelEngine.intefaces;
import utils.DCCList;

/**
 * @author Andrii Andriushchenko
 */
interface IReel 
{
	public var viewPort:IViewPort;
	public var moveRule:IMovementRules;
	public var iconsList:DCCList<IIcon>;
	public var headItem:IIcon;
	public var tailItem:IIcon;
	
	public var transform:ITransform;
	public var geometry:IGeometry;
}