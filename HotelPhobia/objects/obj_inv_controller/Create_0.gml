//Create initial variables and their values
show_inventory = false; //Should the inventory be shown right now?

//Tutorial: https://youtu.be/Bj48UWayTsM

//Using a DS Grid to store items (ds_grid_sort)
/*Stored values (a row is a single item) are: 
 - ID (to sort lowest to highest)
 - variable name (the string to be used in code when using item on an object in the game, as well as checking for combining)
 - item count
 - item description
 - items it could be combined with (e.g. photo_piece1 would have here "photo_piece2,photo_piece3,photo_piece4")
*/
ds_inventory = ds_grid_create(5, 10);

/*ADDENDUM!! The ID can be done through an enumerator, for clarities sake; for example, can = 1, crowbar = 2, 
key = 3, etc. What this means is I can type the "name" of the item, but it still reads to the code as 1, 2, 3 etc.*/
//NOTE!! Enums are implicitly global, meaning if this is defined here, any object can reference it now
enum inv_items {
	unknown = 0,
	can = 1,
	crowbar = 2,
	key = 3
}

//NOTE!! for drawing a sprite as a section from a bigger sprite, use:
//draw_sprite_part() or draw_sprite_part_ext()

//Also, I can use ds_grid_write and ds_grid_read to save and load the invetory on exiting and running the game.