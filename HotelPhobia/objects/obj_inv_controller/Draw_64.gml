/// @description Draw Inventory Screen
//Do not run code and show inventory if show_inventory variable is false
if(!show_inventory) { exit; }

//Draw inventory UI
draw_sprite_part(spr_inv_ui, 0, 18, 0, 142, 35, x, y);


#region //Draw Item Sprites in Inventory Slots
for(i = 0; i < 5; i++) {
	//If accessing grid at this row would exceed the grid height, break loop
	if((first_cell_row + i) >= grid_height) { break; }

	//If not, access item ID at this row
	var _item_id = ds_inventory[# 0, first_cell_row + i];
	
	//If row is empty, no need to continue iterating down the rows
	if(_item_id == inv_items.empty) { break; }
	
	/*Need to mod and div by the same number, hence using width twice 
	and why spritesheet should have the same width and height*/
	//The x and y cordinates of the cell of the item in the inventory grid
	var _cell_x = _item_id mod sheet_cell_width;
	var _cell_y = _item_id div sheet_cell_width;

	//The x and y coordinates of the item sprite in the inventory spritesheet
	var _sprite_x = _cell_x * 16;
	var _sprite_y = _cell_y * 16;
	
	//The x and y coordinates of the cell the item is to be drawn in
	var _real_x = first_inv_cell_x + (cell_width + cell_gap) * i;

	draw_sprite_part(spr_inv_item_sheet, 0, _sprite_x, _sprite_y, cell_width, cell_width, _real_x, first_inv_cell_y);
}
#endregion


#region //Draw indicators for selected item cell and inventory tab
//Determine x coordinate of currently selected item's cell
var selected_item_x = first_inv_cell_x + (cell_width + cell_gap) * (current_inv_cell - 1);

//Draw green square around the selected item slot
draw_sprite_part(spr_inv_ui, 0, 0, 0, 18, 18, selected_item_x-1, first_inv_cell_y-1);
#endregion