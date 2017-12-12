package reelEngine.geometry;

import reelEngine.intefaces.IGeometry;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Geometry implements IGeometry 
{

	public function new(?height:Int, ?width:Int) 
	{
		this.height = height;
		this.width = width;
	}
	
	
	/* INTERFACE reelEngine.intefaces.IGeometry */
	
	public var height:Int;
	
	public var width:Int;
	
}