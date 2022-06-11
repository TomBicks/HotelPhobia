/// @description Slide Inventory
//Incremement or decremenet inventory offset depending if inventory should be visible or not
if(show_inventory) {
	inv_offset = clamp(inv_offset - offset_speed, 0, inv_width);
} else {
	inv_offset = clamp(inv_offset + offset_speed, 0, inv_width);
}
//Factor inventory offset into inventory's local x if visible
if(inv_offset < inv_width) {
	inv_x = gui_width - inv_width + inv_offset;
}