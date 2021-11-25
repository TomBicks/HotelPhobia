#region //Create and prepare the inventory ds_grid
inventory_data = ds_grid_create(4, 7);

/*Stored values (a row is a single item) are: 
 - ID (to sort lowest to highest)
 - item count
 - item description
 - items it could be combined with (e.g. inv_items.photo_piece1 would have here 
   "inv_items.photo_piece2,inv_items.photo_piece3,inv_items.photo_piece4", which is effectively "12,13,14" as it uses ids
*/

//Fill grid with values of 99, as this will be the value to mean a cell is empty
//This is so we can sort in ascending order properly
ds_grid_clear(inventory_data, inv_items.empty);

//Also, I can use ds_grid_write and ds_grid_read to save and load the invetory on exiting and running the game.
#endregion


#region //Define inventory item enumerator
/*ADDENDUM!! The ID can be done through an enumerator, for clarities sake; for example, can = 1, crowbar = 2, 
key = 3, etc. What this means is I can type the "name" of the item, but it still reads to the code as 1, 2, 3 etc.*/
//NOTE!! Enums are implicitly global, meaning if this is defined here, any object can reference it now
enum inv_items {
	//Consumables -- IDs 0 to ??
	unknown = 0,
	can = 1,
	crowbar = 2,
	key = 3,
	battery = 4,
	flashlight = 5,
	keycard = 6,
	note = 7,
	//Key Items -- IDs ?? to ??
	//Notes -- IDs ?? to ??
	empty = 99
}
#endregion