/// @function							scr_inv_item_add(item, added_amount);
/// @param {integer}	item			...
/// @param {string}		added_amount	The amount of the item to be added to the inventory
/// @description						Adds an amount of an item to the inventory
function scr_inv_item_add(_item, _added_amount) {

#region //Check if inventory manager can be accessed; return error if not
if(object_exists(obj_inv_manager)) {
	//Get reference to inventory
	var _inventory = obj_inv_manager.inventory;
}
else {
	show_error("ERROR: Inventory Manager cannot be accessed!", true);
}
#endregion

#region //Check if the inventory already has the item to be added
var _item_index = -1;
for(i = 0; i < array_length(_inventory); i++) {
	//show_message(_inventory[i].name);
	//Get index reference to the desired item; will stay -1 if not in inventory
	if(_inventory[i].name == _item.name) { _item_index = i; }
}
#endregion

#region //Add item/item's amount to the inventory
//Add the 'added_amount' to the item's 'current_amount' in the inventory if it's there already
if(_item_index != -1) {
	var _current_amount = variable_struct_get(_inventory[_item_index], "amount");
	variable_struct_set(_inventory[_item_index], "amount", _current_amount + _added_amount);
}
//Add the item to the inventory if none already exists
else {
	//Set the amount to reflect the amount to be added
	/*NOTE: It seems using 'variable_struct_set' on this sets all of the struct, including 
	in the global item_list, to the amount set, so to get around that we just set it here always*/
	variable_struct_set(_item, "amount", _added_amount);
	//Push the new item with set amount to the inventory array
	array_push(_inventory, _item);
}
#endregion

//Sort arrary at end
//show_message("Does this work?");
array_sort(_inventory, scr_inv_sort);

}