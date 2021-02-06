/// @description DEBUG!! Clear grid
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }
ds_grid_clear(ds_inventory, inv_items.empty);