package reelEngine3.common;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Transform
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