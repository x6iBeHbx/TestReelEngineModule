package reelEngine.icon;

import reelEngine.intefaces.IGeometry;
import reelEngine.intefaces.IIcon;
import reelEngine.intefaces.ITransform;
import starling.display.Image;
import starling.display.Quad;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Icon implements IIcon 
{
	public var transform:ITransform;
	
	public var geometry:IGeometry;
	
	public var id:Int;
	public var image:Image;
	public var imageTemp:Quad;
	
	public function new() 
	{
		
	}
}