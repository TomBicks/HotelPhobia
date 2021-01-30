/// @description Draw Inventory Screen
//Do not run code and show inventory if show_inventory variable is false
if(!show_inventory) { exit; }

/*var height = ds_grid_height(ds_inventory);
for(i = 0; i < height; i++) {
	var item_id = ds_inventory[# 0, i];
	
	//If row is empty, no need to continue iterating down the rows
	if(item_id == inv_items.empty) { break; }
	
	//If row is defined, draw all the info
	draw_set_color(c_black);
	draw_text(i*80, y, ds_inventory[# 0, i]);
	draw_text(i*80, y+40, ds_inventory[# 1, i]);
	draw_text(i*80, y+80, ds_inventory[# 2, i]);
	draw_text(i*80, y+120, ds_inventory[# 3, i]);
}*/

//Draw inventory UI
draw_sprite_part(spr_inv_ui, 0, 18, 0, 142, 35, x, y);


#region //Draw Item Sprites in Inventory Slots
for(i = 0; i < 5; i++) {
	var item_id = ds_inventory[# 0, i];
	
	//If row is empty, no need to continue iterating down the rows
	if(item_id == inv_items.empty) { break; }
	
	/*Need to mod and div by the same number, hence using width twice 
	and why spritesheet should be the same width and height*/
	//The x and y cordinates of the cell of the item in the inventory grid
	var cell_x = item_id mod sheet_cell_width;
	var cell_y = item_id div sheet_cell_width;

	//The x and y coordinates of the item sprite in the inventory spritesheet
	var sprite_x = cell_x * 16;
	var sprite_y = cell_y * 16;
	
	//The x and y coordinates of the cell the item is to be drawn in
	var real_x = first_inv_cell_x + (cell_width + cell_gap) * i;

	draw_sprite_part(spr_inv_item_sheet, 0, sprite_x, sprite_y, cell_width, cell_width, real_x, first_inv_cell_y);
}
#endregion


#region //Draw indicators for selected item cell and inventory tab
//Determine x coordinate of currently selected item's cell
var selected_item_x = first_inv_cell_x + (cell_width + cell_gap) * (current_inv_cell - 1);

//Draw green square around the selected item slot
draw_sprite_part(spr_inv_ui, 0, 0, 0, 18, 18, selected_item_x-1, first_inv_cell_y-1);
#endregion