/// @description Draw config
draw_set_font(font_main);
draw_text(0, 0, "ASCII: " + string(current_key) + ", CHAR: " + chr(current_key));
draw_text(0, 20, "ASCII: " + string(set_key) + ", CHAR: " + chr(set_key) + ", MAP: " + string(keyboard_get_map(set_key)) + ", GLOBAL: " + string(global.asc_def[set_key]));