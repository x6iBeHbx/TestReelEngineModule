package reelEngine2.common.geometry;

import reelEngine.intefaces.ITransform;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Transform implements ITransform 
{

	public function new(?x:Int, ?y:Int) 
	{
		this.x = x;
		this.y = y;
	}
	
	
	/* INTERFACE reelEngine.intefaces.ITransform */
	
	public var x:Int;
	
	public var y:Int;
	
}