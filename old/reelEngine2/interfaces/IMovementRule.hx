package reelEngine2.interfaces;
import reelEngine2.common.geometry.Transform;

/**
 * @author Andrii Andriushchenko
 */
interface IMovementRule 
{
	public function apply(transform:Transform, frameTime:Null<Int>):Transform;
}