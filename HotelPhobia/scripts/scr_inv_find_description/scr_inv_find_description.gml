/// @function						scr_inv_find_description(item_id);
/// @param {integer}	item_id		The ID of the item to find a description for
/// @description					Finds the description of an item and returns it, using the ID of the item

//Set argument to local variable
//ID of the item to find a description for, corresponding to the number on the inv_items enumerator
var item_id = argument0;


#region //Return the description for the item matching the given ID
var description;
switch(item_id) {
	case(inv_items.can):
		description = "This is a can. I could get into it with a can opener.";
		return(description);
	case(inv_items.crowbar):
		description = "This is a crowbar. It can be used for prying things.";
		return(description);
	case(inv_items.key):
		description = "This is a key. I wonder what it unlocks?";
		return(description);
	default:
		description = "I don't know what this is.";
		return(description);
}
#endregion