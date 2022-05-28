/// @description Insert description here
if(show_inventory) {
	//DEBUG!! Drawing items as text lists
	draw_set_color(c_black);
	for(i = 0; i < array_length(inventory); i++) {
		draw_text(0, 15*i, "Name: " + string(inventory[i].name) + ", Amount: " + string(inventory[i].amount)
		+ ", Item Type: " + string(inventory[i].item_type));
	}
	
	//Width & Height of the GUI surface (seems have to get every step; app surface not ready on create event; not big enough)
	var _gui_width = surface_get_width(application_surface);
	var _gui_height = surface_get_height(application_surface);
	
	//Draw inventory background
	draw_set_color(c_gray)
	draw_rectangle(_gui_width-inv_width, _gui_height/2 - inv_height/2, _gui_width, _gui_height/2 + inv_height/2, false);
	
	//Draw inventory slot backgrounds
	draw_set_color(c_ltgray)
	for(i = 0; i < 6; i++) {
		draw_rectangle(_gui_width-inv_width + 6, _gui_height/2 - inv_height/2 + 6 + 54*i, _gui_width - 6, _gui_height/2 - inv_height/2 + 54 + 54*i, false);
	}
	
	//Draw items' sprites in inventory
	for(i = 0; i < array_length(inventory); i++) {
		draw_sprite_ext(spr_item_inv, inventory[i].inventory_sprite_index, _gui_width-inv_width + 6, _gui_height/2 - inv_height/2 + 6 + 54*i, 3, 3, 0, c_white, 1);
	}
}