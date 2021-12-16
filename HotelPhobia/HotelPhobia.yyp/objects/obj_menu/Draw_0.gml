//Set font to custom font
draw_set_font(global.font_main);

//Dynamically measure the dimensions of the menu borders (set custom font before to ensure correct font measured)
//NOTE!! Can proibably replace this with a script in the options, much like I did with rechecking how many options there are
var _new_width = 0
//Find longest of the options and make that represent new width
for(var i = 0; i < opt_length; i++) {
	var _opt_width = string_width(option[menu_level, i]);
	_new_width = max(_new_width, _opt_width);
}
height = opt_border * 2 + string_height(option[0,0]) + (opt_length - 1) * opt_spacing;

// Draw the menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//Align text to top left of menu box
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var i = 0; i < opt_length; i++) {
	var _opt_color = c_white;
	if(menu_pos == i) { _opt_color = c_yellow; }
	draw_text_color(x + opt_border, y + opt_border + (opt_spacing * i), option[menu_level,i], _opt_color, _opt_color, _opt_color, _opt_color, 1);
}