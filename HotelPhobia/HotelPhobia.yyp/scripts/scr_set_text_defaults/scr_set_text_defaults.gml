/// @function							scr_text_defaults
/// @description						Set default properties for a new textbox, including establishing required variables
function scr_set_text_defaults(){

//The position (in characters inward) of each line break, per page
//line_break_pos[number of the line break, number of the current page]
line_break_pos[0, page_total] = 999; //Set default value high so we don't immediately have a line break
//Total number of line breaks on each page
line_break_total[page_total] = 0;
//The width in pixels of the text before a line break
//Used to measure when the text after a line break is too long and we need to make another line break
line_break_offset[page_total] = 0;

#region //Variables for every character
for(var c = 0; c < 500; c++) {
	//Set colour of every character
	colour_1[c, page_total] = c_white;
	colour_2[c, page_total] = c_white;
	colour_3[c, page_total] = c_white;
	colour_4[c, page_total] = c_white;
	
	/*Set floating effect on text (using sine); 'float_dir' is at incrementing degrees so 
	we have a 'wave' effect, as each character will be at different parts of the sine graph*/
	float_text[c, page_total] = 0;
	float_dir[c, page_total] = c*20;
	
	//Set shake effect on text
	shake_text[c, page_total] = 0;
	shake_dir[c, page_total] = irandom(360);
	shake_timer[c, page_total] = irandom(4);
}
#endregion

//The sprite to use for the texbox border; can change for different characters
textbox_spr[page_total] = spr_menu;
//The sprite for the portrait of whatever is speaking
speaker_sprite[page_total] = noone;
//The side the portrait is drawn on, to represent which side the character is speaking from
speaker_side[page_total] = 1;
//The sound used to enunciate text being typed in the texbox by the character speaking
speaker_sound[page_total] = snd_voice_mid;

}