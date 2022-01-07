/// @description Insert description here
#region //Textbox Properties
// Textbox Dimensions
textbox_width = 172;
textbox_height = 74;
// Space between options and menu border
border = 8;
// The separation between each line horizontally
line_sep = 12;
// Width of the line between the borders (text must fit in this width, or move to the next line)
line_width = textbox_width - border*2;
//Sprite of the textbox itself
textbox_spr = spr_menu;
//Image index of the textbox sprite
textbox_img_index = 0;
//Frames per second/animation speed of the textbox sprite/background
textbox_img_speed = 6/60; //NOTE!! Should get a macro to determine FPS like i have before
#endregion

#region //Text properties
//What page of dialogue we are on
page = 0;
//The number of pages of dialogue (length of the text array)
page_total = 0;
//Text string array that stores multiple pages of dialogue (lines are defined through scr_text)
text[0] = "";
//Length of each page of dialogue
text_length[0] = string_length(text[0]);
//Dictates how many of the characters of the text are being drawn currently
draw_char = 0;
//Speed at which the textbox typrwrites text
text_speed = 1;
#endregion

//If setup has already been completed or not
setup = false;