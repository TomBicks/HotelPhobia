/// @function						scr_inv_find_combinations(item_id);
/// @param {integer}	item_id		The ID of the item to find a list of item combinations for, corresponding to the number on the inv_items enumerator
/// @description					Finds the list of items combinable with the item and returns it, using the ID of the item
function scr_inv_find_combinations(_item_id) {

#region //Return the list of item combinations for the item matching the given ID
	var _combinations;
	switch(_item_id) {
		case(inv_items.can):
			_combinations = inv_items.crowbar;
			return(_combinations);
		case(inv_items.crowbar):
			_combinations = inv_items.can;
			return(_combinations);
	}
#endregion

}
