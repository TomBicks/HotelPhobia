/// @function							scr_inv_check_item(item_id, consume_item);
/// @param {integer}	item_id			The ID of the item to be checked for (can be an enum field)
/// @param {boolean}	consume_item	Whether the item is consumed in the process
/// @description						Adds an item to the inventory, then sorts it by ID


#region //Set arguments to local variables
//ID of the item to be checked for, corresponding to the number on the inv_items enumerator
var item_id = argument0;

//Amount of the item to be added to the inventory
var consume_item = argument1;
#endregion


#region //Check the grid for a matching id of the item
var height = ds_grid_height(ds_inventory);
for(i = 0; i < height; i++) {
	cell = ds_inventory[# 0, i];
	
	//If row found is the id, means the item exist in the inventory and the script returns true
	if(cell == item_id) {
		//If consume_item is true, remove 1 from the item's amount
		//if(consume_item) { scr_inv_remove_item(item_id, 1); }
		return true;
	}
	
	//If row found that is 99, means we have reached the end of the items and should stop the for loop here
	if(cell == inv_items.empty) { break; }
}

//If code manages to reach this point, it means that item is not in the inventory, thus returning false
return false;
#endregion