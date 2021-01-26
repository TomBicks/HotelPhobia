/// @description DEBUG!! Add random amounts of random items to the inventory 
var item_id = irandom_range(1, 3);
var item_amount = irandom_range(1, 6);
scr_inv_add_item(item_id, item_amount);
//show_message("Added item #" + string(item_id) + " x " + string(item_amount));