package reelEngine3.interfaces;
import reelEngine3.common.Transform;

/**
 * @author Andrii Andriushchenko
 */
interface IMovementRule 
{
	public function apply(transform:Transform, frameTime:Null<Int>):Transform;
}