package reelEngine3.interfaces;

/**
 * @author Andrii Andriushchenko and Mykola Kamenyk
 */
interface IGeometry
{
	public function intersects(geometry:IGeometry):Bool;
}