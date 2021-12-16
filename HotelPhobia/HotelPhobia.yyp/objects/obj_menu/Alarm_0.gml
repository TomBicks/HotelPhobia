/// @description Dynamically calculate initial height & width
draw_set_font(global.font_main);
var _new_width = 0
//Find longest of the options and make that represent new width
for(var i = 0; i < opt_length; i++) {
	var _opt_width = string_width(option[menu_level, i]);
	_new_width = max(_new_width, _opt_width);
}
width = _new_width + opt_border * 2;
height = opt_border * 2 + string_height(option[0,0]) + (opt_length - 1) * opt_spacing;