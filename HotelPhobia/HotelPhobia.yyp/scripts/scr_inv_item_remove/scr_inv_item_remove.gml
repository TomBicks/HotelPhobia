/// @function							scr_inv_item_remove(item, removed_amount);
/// @param {integer}	item			...
/// @param {string}		removed_amount	The amount of the item to be removed from the inventory
/// @description						Removes an amount of an item from the inventory
function scr_inv_item_remove(_item, _removed_amount) {

#region //Check if inventory manager can be accessed; return error if not
if(object_exists(obj_inv_manager)) {
	//Get reference to inventory
	var _inventory = obj_inv_manager.inventory;
}
else {
	show_error("ERROR: Inventory Manager cannot be accessed!", true);
}
#endregion

#region //Check if the inventory has the item to be removed
var _item_index = -1;
for(i = 0; i < array_length(_inventory); i++) {
	//Get index reference to the desired item; will stay -1 if not in inventory
	if(_inventory[i].name == _item.name) { _item_index = i; }
}
#endregion

#region //Remove item/item's amount from the inventory
//Remove the 'removed_amount' from the item's 'current_amount' in the inventory if it's there already
if(_item_index != -1) {
	var _current_amount = variable_struct_get(_inventory[_item_index], "amount");
	//If subtracting 'removed_amount' from 'current_amount' would have it become negative, remove the item from the inventory
	if(_current_amount - _removed_amount < 0) {
		array_delete(_inventory, _item_index, 1);
	}
	else {
		variable_struct_set(_inventory[_item_index], "amount", _current_amount - _removed_amount);
	}
}
#endregion

//Sort arrary at end
array_sort(_inventory, scr_inv_sort);

}