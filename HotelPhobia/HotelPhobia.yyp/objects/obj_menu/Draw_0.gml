// Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < opt_length; i++) {
	draw_text(x + opt_border, y + opt_border + (opt_spacing * i), option[i]);
}