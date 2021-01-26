/// @function							scr_inv_add_item();
/// @param {integer}	item_id			The id of the item to be added (can be an enum field)
/// @param {string}		item_amount		The amount of the item to be added
/// @description						Adds an item to the inventory, then sorts it by ID


#region //Set arguments to local variables
//ID of the item to be added, corresponding to the number on the inv_items enumerator
var item_id = argument0;

//Amount of the item to be added to the inventory
var item_amount = argument1;
#endregion


#region //Check the grid for instances of the item or add it otherwise
var height = ds_grid_height(ds_inventory);
for(i = 0; i < height; i++) {
	cell = ds_inventory[# 0, i];
	
	//If row found that matches the given item_id, the item is already in the inventory
	//This means we only need to increase the amount of the item by item_amount
	if(cell == item_id) {
		ds_inventory[# 3, i] += item_amount;
		break;
	}
	
	//If row found that is undefined, means item is not in inventory
	//This means we add the item to the first undefined row we just found
	if(is_undefined(cell)) {
		
	}
}
#endregion


/*NOTE!! Basically what I should do here is have a for loop iterate through everything.
If it finds the id that matches the id provided (item_id), then it increases the count,
because the item already exists in the inventory. If it finds an empty row before then,
implying the item is not in the inventory, then it adds it to a new row and sorts it.
There is no need to sort if no new item is added however, but if only the count is increased.*/

//Set the first row that is empty to the value of the new item

//Sort the grid's rows by ID to reflect the ordering of items
ds_grid_sort(ds_inventory, 1, true);