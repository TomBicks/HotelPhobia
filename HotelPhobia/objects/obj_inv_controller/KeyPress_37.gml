/// @description Navigate Inventory Cell Left
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }

//Decrease currently selected cell by one, clamping between 1 and 5 (the first and last cells)
current_inv_cell = clamp(--current_inv_cell, 1, 5);