/// @function							scr_inv_add_item(item_id, item_amount);
/// @param {integer}	item_id			The ID of the item to be added (can be an enum field)
/// @param {string}		item_amount		The amount of the item to be added
/// @description						Adds an item to the inventory, then sorts it by ID
function scr_inv_add_item(argument0, argument1) {


#region //Set arguments to local variables
	//ID of the item to be added, corresponding to the number on the inv_items enumerator
	var _item_id = argument0;

	//Amount of the item to be added to the inventory
	var _item_amount = argument1;
#endregion


#region //Check the grid for instances of the item or add it otherwise
	var _height = ds_grid_height(ds_inventory);
	for(i = 0; i < _height; i++) {
		var _cell = ds_inventory[# 0, i];
	
		//If row found that matches the given item_id, the item is already in the inventory
		//This means we only need to increase the amount of the item by item_amount
		if(_cell == _item_id) {
			ds_inventory[# 1, i] += _item_amount;
			break;
		}
	
		//If row found that is 99, means item is not in inventory
		//This means we add the item to the first blank row we just found
		if(_cell == inv_items.empty) {
			//Add item ID
			ds_inventory[# 0, i] = _item_id;
		
			//Add item amount
			ds_inventory[# 1, i] = _item_amount;
		
			//Add item description
			ds_inventory[# 2, i] = scr_inv_find_description(_item_id);
		
			//Add item combination list (if any)
			ds_inventory[# 3, i] = scr_inv_find_combinations(_item_id);
		
			//Sort the grid's rows by ID so the item is in the correct position, in descending order
			ds_grid_sort(ds_inventory, 0, true);
			break;
		}
	}
#endregion


}
