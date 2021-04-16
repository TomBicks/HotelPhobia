/// @description Navigate Inventory Cell Left
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }

//Decrease currently selected cell by one, clamping between 1 and 5 (the first and last cells)
//current_inv_cell = clamp(--current_inv_cell, 1, 5);

if(first_cell_row > 0) {
	show_debug_message("Haven't reached end of grid; set next_inv_cell value");
	var _next_inv_cell = ds_inventory[# 0, first_cell_row + current_inv_cell - 2];
	show_debug_message(_next_inv_cell);
	if(_next_inv_cell != inv_items.empty) {
		show_debug_message("Next cell isn't empty");
		if(current_inv_cell == 3) {
			show_debug_message("Still in the middle items; decrement row, not cell");
			first_cell_row--;
		} else {
			show_debug_message("Reached the last few items; decrement cell, not row");
			current_inv_cell--;
		} 
	} else {
		show_debug_message("Next cell is empty");	
	}
} else {
	//DEBUG!!
	show_debug_message(first_cell_row);
	show_debug_message("Have reached end of grid; cannot decrement further");
}