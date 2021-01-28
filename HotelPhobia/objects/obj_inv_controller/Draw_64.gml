/// @description Draw Inventory Screen
//Do not run code and show inventory if show_inventory variable is false
if(!show_inventory) { exit; }

/*var height = ds_grid_height(ds_inventory);
for(i = 0; i < height; i++) {
	var item_id = ds_inventory[# 0, i];
	
	//If row is empty, now need to continue iterating down the rows
	if(item_id == inv_items.empty) { break; }
	
	//If row is defined, draw all the info
	draw_set_color(c_black);
	draw_text(i*80, y, ds_inventory[# 0, i]);
	draw_text(i*80, y+40, ds_inventory[# 1, i]);
	draw_text(i*80, y+80, ds_inventory[# 2, i]);
	draw_text(i*80, y+120, ds_inventory[# 3, i]);
}*/

//Draw inventory UI
draw_sprite(spr_inv_ui, 0, x, y);


#region //Draw Item Sprites

//var item_id_to_draw = 2;

for(i = 0; i < 5; i++) {
	var item_id = ds_inventory[# 0, i];
	
	//If row is empty, now need to continue iterating down the rows
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
	var real_y = first_inv_cell_y;

	draw_sprite_part(spr_inv_item_sheet, 0, sprite_x, sprite_y, cell_width, cell_width, real_x, real_y);
	
	//If row is defined, draw all the info
	//draw_text(i*80, y, ds_inventory[# 0, i]);
	//draw_text(i*80, y+40, ds_inventory[# 1, i]);
	//draw_text(i*80, y+80, ds_inventory[# 2, i]);
	//draw_text(i*80, y+120, ds_inventory[# 3, i]);
}
#endregion