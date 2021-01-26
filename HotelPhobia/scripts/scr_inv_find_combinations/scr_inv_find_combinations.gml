/// @function						scr_inv_find_combinations(item_id);
/// @param {integer}	item_id		The ID of the item to find a list of item combinations for
/// @description					Finds the list of items combinable with the item and returns it, using the ID of the item

//Set argument to local variable
//ID of the item to find a list of item combinations for, corresponding to the number on the inv_items enumerator
var item_id = argument0;


#region //Return the list of item combinations for the item matching the given ID
var combinations;
switch(item_id) {
	case(inv_items.can):
		combinations = inv_items.crowbar;
		return(combinations);
	case(inv_items.crowbar):
		combinations = inv_items.can;
		return(combinations);
}
#endregion