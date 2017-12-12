package reelEngine3.interfaces;
import utils.DCCList;

/**
 * @author Andrii Andriushchenko
 */
interface IPlacementRule<T:IGeometry>
{
	public function apply(items:DCCList<IReelItem<T>>):T;
}