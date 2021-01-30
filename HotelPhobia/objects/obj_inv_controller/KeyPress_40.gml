/// @description Navigate Inventory Tab Down
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }

//Increase currently selected tab by one, clamping between 1 and 3 (the first and last tab)
current_inv_tab = clamp(++current_inv_tab, 1, 3);