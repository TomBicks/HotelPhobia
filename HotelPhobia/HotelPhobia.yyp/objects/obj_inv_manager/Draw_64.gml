/// @description Insert description here
if(show_inventory) {
	//DEBUG!! Drawing items as text lists
	for(i = 0; i < array_length(inventory); i++) {
		draw_text(0, 15*i, "Name: " + string(inventory[i].name) + ", Amount: " + string(inventory[i].amount)
		+ ", Item Type: " + string(inventory[i].item_type));
	}
	
	//Draw items' sprites in inventory
	for(i = 0; i < array_length(inventory); i++) {
		draw_sprite(spr_item_inv, inventory[i].inventory_sprite_index, 0, 100 + i*20);
	}
}