/// @description Insert description here
//show_message("Inv Draw GUI " + string(display_get_gui_width()));
if(show_inventory) {
	//DEBUG!! Drawing items as text lists
	draw_set_color(c_black);
	for(i = 0; i < array_length(inventory); i++) {
		draw_text(0, 15*i, "Name: " + string(inventory[i].name) + ", Amount: " + string(inventory[i].amount)
		+ ", Item Type: " + string(inventory[i].item_type));
	}
	
	//Draw inventory background
	draw_set_color(c_gray)
	draw_rectangle(inv_x, inv_y, gui_width, inv_y + inv_height, false);
	
	//Draw inventory slot backgrounds
	draw_set_color(c_ltgray)
	for(i = 0; i < 6; i++) {
		draw_rectangle(inv_x + 6, inv_y + 6 + 54*i, gui_width - 6, inv_y + 54 + 54*i, false);
	}
	
	//Draw items' sprites in inventory
	for(i = 0; i < array_length(inventory); i++) {
		draw_sprite_ext(spr_item_inv, inventory[i].inventory_sprite_index, inv_x + 6, inv_y + 6 + 54*i, 3, 3, 0, c_white, 1);
	}
	
	//Draw reticle showcasing which item is currently selected
	//NOTE!! draw rectangle using the same code as drawing the inventory slots rectangles above, just with a specific 'i' and an outline
	//draw_rectangle()
}