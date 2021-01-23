//Inherit outline code from parent object
event_inherited();

if(!switch_on) {
	draw_sprite(sprite_index, 0, x, y);
} else {
	draw_sprite(sprite_index, 1, x, y);
}