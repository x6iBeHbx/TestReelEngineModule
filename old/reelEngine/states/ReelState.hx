package reelEngine.states;

import reelEngine.intefaces.IMovementRules;

/**
 * ...
 * @author Andrii Andriushchenko
 */
abstract ReelState()
{
	public var stateId(default, null):String;
	public var stateMap:Map<String, String> = new Map<String, String>();
	public var moveRule(default, null):IMovementRules;
		
	public function onEnter(){};
	public function update(){};
	public function onExit(){};
	
	public function new(stateId:String, moveRule:IMovementRules) {
		this.stateId = stateId;
		this.moveRule = moveRule;
	}
	
	public function addTransition(trans:String, stateId:String)
	{
		if (stateMap.exists(trans))
		{
			throw('This transition $trans already regiter');
		}

		stateMap.set(trans, stateId);
	}

	public function removeTransition(trans:String)
	{
		stateMap.remove(trans);
	}
	
	public function getOutputStateId(trans:String):String{
		return stateMap.get(trans);
	}
	
	private function set_moveRule(value:IMovementRules)
	{
		moveRule = value;
	}

	private function get_moveRule():IMovementRules
	{
		return moveRule;
	}

	private function set_stateId(value:String)
	{
		stateId = value;
	}

	private function get_stateId():String
	{
		return stateId;
	}
}