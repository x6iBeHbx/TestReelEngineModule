package reelEngine.movementRules.rulesForViewPort;

import reelEngine.intefaces.IMovementRules;
import reelEngine.intefaces.ITransform;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class RuleBounceFromUpToDown implements IMovementRules 
{

	private var _speed:Int;
	private var _depth:Int;
	public function new(speed:Int, depth:Int, intensity:Int) 
	{
		_speed = speed;
		_depth = depth;
	}
	
	
	/* INTERFACE reelEngine.intefaces.IMovementRules */
	
	public function update(trasform:ITransform, frameTime:Null<Int>) 
	{
		
	}
	
	private function start2(p:Float, delta:Float):Void
	{
		array = new Array<Float>();
		var temp = -p;
		var posY:Float = -((Math.pow((temp), 2) - Math.pow(p, 2)))/1;
		while(temp <= p ){
			posY = -((Math.pow((temp), 2) - Math.pow(p, 2)))/1;
			array.push(posY);
			temp += speed;
		}
	}
}