/// @description Insert description here
if(show_inventory) {
	for(i = 0; i < array_length(inventory); i++) {
		draw_text(0, 15*i, "Name: " + string(inventory[i].name) + ", Amount: " + string(inventory[i].amount)
		+ ", Item Type: " + string(inventory[i].item_type));
	}
}