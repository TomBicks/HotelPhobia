// Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//Draw the options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < opt_length; i++) {
	var _opt_color = c_white;
	if(menu_pos == i) { _opt_color = c_yellow; }
	draw_text_color(x + opt_border, y + opt_border + (opt_spacing * i), option[i], _opt_color, _opt_color, _opt_color, _opt_color, 1);
}