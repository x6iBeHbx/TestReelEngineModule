package reelEngine2.interfaces;
import reelEngine3.interfaces.IGeometry;
import utils.DCCList;

/**
 * @author Andrii Andriushchenko
 */
interface IPlacementRule<T:IGeometry>
{
	public function apply(items:DCCList<IReelItem<T>>):T;
}