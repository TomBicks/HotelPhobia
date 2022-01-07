/// @description Store important information needed for the game

//Create a font for the game (the font used starts from character 32 in UTF8)
global.font_main = font_add_sprite(spr_main_font, 32, true, 1);

//Define Macros for the specific depths for certain kinds of objects
#macro TEXTBOX_LAYER -9999