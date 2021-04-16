/// @description Navigate Inventory Cell Right
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }

//Increase currently selected cell by one, clamping between 1 and 5 (the first and last cells)
//current_inv_cell = clamp(++current_inv_cell, 1, 5);

/*When navigating right, 
 - check if next item to the right actually exists and is not empty or undefined; otherwise don't allow movement right
 - if in 3rd cell, check if there are items beyond the 5th; if not, we've reached the end and allow movement beyond the 3rd slot
*/

if((first_cell_row+4) < ds_grid_height(ds_inventory)) {
	show_debug_message("Haven't reached end of grid; set next_inv_cell value");
	var _next_inv_cell = ds_inventory[# 0, first_cell_row + current_inv_cell];
	show_debug_message(_next_inv_cell);
	if(_next_inv_cell != inv_items.empty) {
		show_debug_message("Next cell isn't empty");
		if(current_inv_cell == 3) {
			show_debug_message("Still in the middle items; increment row, not cell");
			first_cell_row++;
		} else {
			show_debug_message("Reached the last few items; increment cell, not row");
			current_inv_cell++;
		}
	} else {
		show_debug_message("Next cell is empty");	
	}
} else {
	//DEBUG!!
	show_debug_message(first_cell_row);
	show_debug_message("Have reached end of grid; cannot increment further");
}

//show_message("first_cell_row = " + string(first_cell_row));
//show_message("current_inv_cell = " + string(current_inv_cell));