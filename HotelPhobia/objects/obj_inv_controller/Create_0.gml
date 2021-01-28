//Inventory Tutorial: https://youtu.be/Bj48UWayTsM

//Create initial variables and their values
show_inventory = false; //Should the inventory be shown right now?


#region //Create and prepare the inventory ds_grid
ds_inventory = ds_grid_create(4, 5);

/*Stored values (a row is a single item) are: 
 - ID (to sort lowest to highest)
 - item count
 - item description
 - items it could be combined with (e.g. inv_items.photo_piece1 would have here 
   "inv_items.photo_piece2,inv_items.photo_piece3,inv_items.photo_piece4", which is effectively "12,13,14" as it uses ids
*/

//Fill grid with values of 99, as this will be the value to mean a cell is empty
//This is so we can sort in ascending order properly
ds_grid_clear(ds_inventory, inv_items.empty);

//Also, I can use ds_grid_write and ds_grid_read to save and load the invetory on exiting and running the game.
#endregion


#region //Define inventory item enumerator
/*ADDENDUM!! The ID can be done through an enumerator, for clarities sake; for example, can = 1, crowbar = 2, 
key = 3, etc. What this means is I can type the "name" of the item, but it still reads to the code as 1, 2, 3 etc.*/
//NOTE!! Enums are implicitly global, meaning if this is defined here, any object can reference it now
enum inv_items {
	unknown = 0,
	can = 1,
	crowbar = 2,
	key = 3,
	empty = 99
}
#endregion


#region //Create initial variables and their values
/*Only need to read width of the spritesheet, as for this to work, 
the width and height of the spritesheet need to be the same*/
sheet_cell_width = sprite_get_width(spr_inv_item_sheet) / 16;

//x and y coordinates of the top left of the first inventory cell in the ui
first_inv_cell_x = 37;
first_inv_cell_y = 3;

//Width of each inventory cell
cell_width = 16;

//Pixels between inventory cells
cell_gap = 5;
#endregion