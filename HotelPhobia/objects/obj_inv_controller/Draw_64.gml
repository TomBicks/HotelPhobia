/// @description Draw Inventory Screen
//Do not run code and show inventory if show_inventory variable is false
if(!show_inventory) { exit; }

height = ds_grid_height(ds_inventory);
for(i = 0; i < height; i++) {
	var item_id = ds_inventory[# 0, i];
	
	//If row is undefined, now need to continue iterating down the rows
	if(item_id == 99) { break; }
	
	//If row is defined, draw all the info
	draw_set_color(c_black);
	draw_text(i*80, y, ds_inventory[# 0, i]);
	draw_text(i*80, y+40, ds_inventory[# 1, i]);
	draw_text(i*80, y+80, ds_inventory[# 2, i]);
	draw_text(i*80, y+120, ds_inventory[# 3, i]);
}