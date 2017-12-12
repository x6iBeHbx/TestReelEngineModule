package reelEngine.viewPort;
import haxe.xml.Check.Rule;
import reelEngine.intefaces.IIcon;
import reelEngine.intefaces.IMovementRules;
import utils.DCCList;

import reelEngine.intefaces.IGeometry;
import reelEngine.intefaces.ITransform;
import reelEngine.intefaces.IViewPort;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class ReelViewPort implements IViewPort 
{
	/* INTERFACE reelEngine.intefaces.IViewPort */
	
	public var transform:ITransform;
	public var geometry:IGeometry;
	public var moveRule:IMovementRules;
	
	private var tempDelta:Int; // need for specail logic when marker move to minus coordinate and need check
	
	@:isVar public var listViewItem(get, set):DCCList<IIcon>;
	
	public function new() 
	{
		listViewItem = new DCCList<IIcon>();
	}

	public function isEnterToViewPort(item:IIcon):Bool 
	{
		if ((item.transform.y >= this.transform.y && item.transform.y < this.transform.y + this.geometry.height) ||
		(item.transform.y + item.geometry.height > this.transform.y && item.transform.y + item.geometry.height <= this.transform.y + this.geometry.height))
		{
			return true;
		}
		
		return false;
	}
	
	function get_listViewItem():DCCList<IIcon> 
	{
		return listViewItem;
	}
	
	function set_listViewItem(value:DCCList<IIcon>):DCCList<IIcon> 
	{
		return listViewItem = value;
	}
}