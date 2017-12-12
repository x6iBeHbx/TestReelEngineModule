package reelEngine.intefaces;
import openfl.utils.Function;
import reelEngine.config.ReelEngineConfig;
import utils.DCCList;

/**
 * @author Andrii Andriushchenko
 */
interface IMovementRules 
{
	public function update(trasform:ITransform, frameTime:Null<Int>):Void;
}