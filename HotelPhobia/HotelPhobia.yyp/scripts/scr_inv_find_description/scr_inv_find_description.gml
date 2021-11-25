/// @function						scr_inv_find_description(item_id);
/// @param {integer}	item_id		The ID of the item to find a description for
/// @description					Finds the description of an item and returns it, using the ID of the item
function scr_inv_find_description(argument0) {

	//Set argument to local variable
	//ID of the item to find a description for, corresponding to the number on the inv_items enumerator
	var _item_id = argument0;


#region //Return the description for the item matching the given ID
	var _description;
	switch(_item_id) {
		case(inv_items.can):
			_description = "This is a can. I could get into it with a can opener.";
			return(_description);
		case(inv_items.crowbar):
			_description = "This is a crowbar. It can be used for prying things.";
			return(_description);
		case(inv_items.key):
			_description = "This is a key. I wonder what it unlocks?";
			return(_description);
		case(inv_items.battery):
			_description = "This is a battery. I can use it to recharge devices.";
			return(_description);
		case(inv_items.flashlight):
			_description = "This is a flashlight. I can use it to light up dark places.";
			return(_description);
		case(inv_items.keycard):
			_description = "This is a keycard. I wonder what it unlocks?";
			return(_description);
		case(inv_items.note):
			_description = "This is a note. I wonder what it has written?";
			return(_description);
		default:
			_description = "I don't know what this is.";
			return(_description);
	}
#endregion


}
