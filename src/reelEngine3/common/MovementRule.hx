package reelEngine3.common;
import reelEngine3.interfaces.IMovementRule;


/**
 * ...
 * @author Andrii Andriushchenko
 */
class MovementRule implements IMovementRule 
{

	private var _speed:Int;
	public function new(speed:Int) 
	{
		_speed = speed;
	}
	
	public function apply(transform:Transform, frameTime:Null<Int>):Transform 
	{
		transform.y -= frameTime * _speed;
		return transform;
	}
}