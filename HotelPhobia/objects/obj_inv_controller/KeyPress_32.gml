/// @description DEBUG!! Add random amounts of random items to the inventory 
//Do not run code if inventory is not shown
if(!show_inventory) { exit; }

var _item_id = irandom_range(1, 7);
var _item_amount = irandom_range(1, 6);
scr_inv_add_item(_item_id, _item_amount);
//show_message("Added item #" + string(item_id) + " x " + string(item_amount));

//show_message("cell x = " + string(item_id mod 10));
//show_message("cell y = " + string(item_id div 10));