/// @description Insert description here
#region //Textbox properties
// Textbox Dimensions
textbox_width = 172;
textbox_height = 74;
// Space between text and menu border horizontally
border = 8;
// The separation between each line vertically
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

//Initialise arrays to store, for each text character, their...
//...Value ("a", "+", "3", etc.
char[0, 0] = "";
//...x coordinate
char_x[0, 0] = 0;
//... and y coordinate
char_y[0, 0] = 0;

//Dictates how many of the characters of the text are being drawn currently, up to 'draw_char' characters inward
draw_char = 0;
//Speed at which the textbox typrwrites text
text_speed = 1;
#endregion

#region //Options
//List of text options during dialogue
option[0] = "";
//List of unique text ids that each option will lead towards, retrieving more dialogue
option_link_id[0] = -1;
//Position of currently selected option
option_pos = 0;
//Total number of options
option_total = 0;
//Seperaton between each option horizontally
op_sep = 15;
//Space between options and option border vertically
op_border = 8;
#endregion

//If setup has already been completed or not
setup = false;

#region //Effects???
scr_set_text_defaults();
//Keeps check off the last free space, i.e. where the last word ends
//Used in conjunction with measuring the length of the words before it to see where a line break should go, i.e. at the last free sapce
last_free_space = 0;
#endregion