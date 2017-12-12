package reelEngine.movementRules.rulesForViewPort;

import reelEngine.intefaces.IMovementRules;
import reelEngine.intefaces.ITransform;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class RuleMoveReelUpToDown implements IMovementRules 
{
	
	private var _speed:Int;
	public function new(speed:Int) 
	{
		_speed = speed;
	}
	
	
	/* INTERFACE reelEngine.intefaces.IMovementRules */
	
	public function update(trasform:ITransform, frameTime:Null<Int>):Void
	{
		trasform.y -= frameTime * _speed;
	}
}