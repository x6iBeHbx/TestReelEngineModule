package reelEngine.states;
import utils.DCCList;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class ReelStateMachine 
{
	public var states:DCCList<ReelState>;
	
	public var currentState(default, null):ReelState;
	
	public function new() 
	{
		states = new DCCList<ReelState>();
	}
	
	public function addState(state:ReelState){
		
		//TODO: need add to DCCList exist methode
		//Use add because add faster than push
		states.add(state);
	}
	
	public function removeState(state:ReelState){
		states.removeElement(state);
	}
	
	public function executeTransition(trans:String){
		
		var id = currentState.getOutputStateId(trans);
		
		if (id == null) return;
		
		for(state in states){
			if(state.stateId == id){
				currentState.onExit();
				currentState = state;
				currentState.onEnter();
			}
		}
	}
	
	private function set_currentState(state:ReelState){
		currentState = state;
	}

	private function get_currentState():ReelState{
		return currentState;
	}
}