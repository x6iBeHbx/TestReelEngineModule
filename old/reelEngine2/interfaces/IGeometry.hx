package reelEngine2.interfaces;
import reelEngine3.interfaces.IGeometry;

/**
 * @author Andrii Andriushchenko and Mykola Kamenyk
 */
interface IGeometry
{
	public function intersects(geometry:IGeometry):Bool;
}