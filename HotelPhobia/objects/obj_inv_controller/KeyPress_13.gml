/// @description Use currently selected item
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }

var _current_item_id = ds_grid_get(ds_inventory, 0, first_cell_row+current_inv_cell-1);
show_message("Used item id #" + string(_current_item_id));