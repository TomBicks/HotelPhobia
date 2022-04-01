accept_key = keyboard_check_pressed(vk_space);

//Coords of the textbox in relation to the camera view
textbox_x = camera_get_view_x(view);
textbox_y = camera_get_view_y(view) + 24;

#region //Setup
if(!setup) {
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages, where p is the page we are on
	for(var p = 0; p < page_total; p++) {
		//Find how many characters are on each page and store that number in the 'text_length' array
		text_length[p] = string_length(text[p]);
		
		//Get the x position for the textbox
		//X coord if character on the left
		text_x_offset[p] = 80;
		portrait_x_offset[p] = 8;
		
		//X coord if character on the right
		if(speaker_side[p] == -1) {
			text_x_offset[p] = 8;
			portrait_x_offset[p] = 216;
		}
		
		//X coord if no character speaking
		if(speaker_side[p] == noone) {
			text_x_offset[p] = 44;
		}
		
		//Setting individual characters and finding where the line breaks should go in the text
		for(var c = 0; c < text_length[p]; c++) {
			//As string character position values start from 1 and not 0, this variable sets 'c' to the correct value for the desired character position
			var _char_pos = c+1;
			
			//Store individual characters to the 'char' array
			char[c, p] = string_char_at(text[p], _char_pos);
			
			 //Grab a copy of the line from the start up to '_char_pos'
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			//Get current width of the line, excluding the character currently being looped through
			var _current_text_width = string_width(_text_up_to_char) - string_width(char[c,p]);
			
			//Get the last free space (the +1 means the line break starts after the " " rather than before, so we don't get text sticking out on the new line)
			if(char[c, p] == " ") { last_free_space = _char_pos+1; }
			
			#region //Get the line breaks (break if the width of the text in pixels, minus the previous offset, is greater than the maximum line width)
			if(_current_text_width - line_break_offset[p] > line_width) {
				//If text goes over the line width, set the newest line break to be at the last free space
				line_break_pos[line_break_total[p], p] = last_free_space;
				//Increase value representing total number of line breaks, as we are adding a new one
				line_break_total[p]++;
				//String representing all text up to the last free space
				var _text_up_to_last_free_space = string_copy(text[p], 1, last_free_space);
				//String representing the last free space itself, so that we can remove it from the string before
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				//Make the offset up to the end of the string which has been broken, excluding the last free space???
				//SO how this works is that we go through a line until it's too long, then we break it
				//When it gets broken, we store how long that string is before the line break so that we can
				//check for the length of the next line, by checking against all the characters *after* the offset
				//This is why we subtract the offset when determining if the string is too long
				//For example, our first line could be too long at character 85; thus, offset becomes 84, as we exclude the last free space's character
				//On the next iteration, with the new line starting from characters 85 onwards, we need to check
				//if the line width + 85 is too long again. And so the cycle repeats.
				line_break_offset[p] = string_width(_text_up_to_last_free_space) - string_width(_last_free_space_string);
			}
			#endregion
		}
		
		#region //Getting each character's coordinates
		
		//NOTE!! WILL NEED TO GO OVER THE VIDEO AND ADD NOTES HERE; THERE'S A LOT GOING ON HERE!!
		
		for(var c = 0; c < text_length[p]; c++) {
			var _char_pos = c+1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			
			//Get current width of the line
			var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_width = string_width(_txt_up_to_char) - string_width(char[c, p]);
			var _txt_line = 0; //The current line; used to multiply y coord if char is on lines beyond first
			
			//Compensate for string breaks
			for(var lb = 0; lb < line_break_total[p]; lb++) {
				//If the current character being looped through is after a line break
				if(_char_pos >= line_break_pos[lb, p]) {
					var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p]);
					_current_text_width = string_width(_str_copy);
					
					//Record the "line" this should be on
					_txt_line = lb+1; //+1 since lb starts at 0, but we don't want to multiply the y coord by 0; we want to start at 1
				}
			}
			
			//Add to the x and y coords of current character based on the new info from calculations
			char_x[c, p] = _txt_x + _current_text_width;
			char_y[c, p] = _txt_y + _txt_line * line_sep;
		}
		#endregion
	}
}
#endregion

#region //Typing the text
//If the pause timer is at 0, resume typing as normal
if(text_pause_timer <= 0) {
	if(draw_char < text_length[page]) {
		//The faster the text speed, the faster the typewriter gets through the characters
		draw_char += text_speed;
		//Make sure 'draw_char' isn't negative or beyond the number of characters we have to draw
		draw_char = clamp(draw_char,0,text_length[page]);
		var _check_char = string_char_at(text[page], draw_char);
		if(_check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == ",") {
			text_pause_timer = text_pause_duration;
			//Trigger typing sound (if not already making the typing noise, to avoid e.g. "I." making two noises)
			if(!audio_is_playing(speaker_sound[page])) { 
				audio_play_sound(speaker_sound[page], 8, false) 
			}
		}
		else {
			//typing sound effect
			if(snd_count < snd_delay) {
				snd_count++;
			}
			else {
				snd_count = 0;
				audio_play_sound(speaker_sound[page], 8, false);
			}
		}
	}
} 
//Tick the pause timer down if it's still above 0
else {
	text_pause_timer--;
}

#endregion

#region //Flip through pages
if(accept_key) {
	//If typing is done
	if(draw_char == text_length[page]) {
		//If there is another page after this
		if(page < page_total-1) {
			//Go to start of next page
			page++;
			draw_char = 0;
		}
		//If on last page
		else {
			//If an option link exists, create new textbox with selected option 
			if(option_total > 0) {
				scr_create_textbox(option_link_id[option_pos]);
			}
			//Destroy textbox, as dialogue is finished
			instance_destroy();
		}
	}
	//If typing is not done
	else {
		draw_char = text_length[page];
	}
}
#endregion

#region //Draw the textbox
var _textbox_x = textbox_x + text_x_offset[page];
var _textbox_y = textbox_y;
textbox_img_index += textbox_img_speed;
textbox_spr_width = sprite_get_width(textbox_spr[page]);
textbox_spr_height = sprite_get_height(textbox_spr[page]);

//Draw the speaker
if(speaker_sprite[page] != noone) {
	//Stop animating portrait if no longer typing text
	if(draw_char == text_length[page]) { image_index = 0; }
	
	sprite_index = speaker_sprite[page];
	var _speaker_x = textbox_x + portrait_x_offset[page];
	//If portrait needs to be flipped, add back in width of the sprite to x coord, as origin will be flipped and it won't look right
	if(speaker_side[page] == -1) {
		_speaker_x += sprite_width;
	}
	//Draw the speaker border
	draw_sprite_ext(textbox_spr[page], textbox_img_index, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/textbox_spr_width, sprite_height/textbox_spr_height, 0, c_white, 1);
	//Draw the speaker portrait
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
}

//Draw back of the textbox (animated background and border)
draw_sprite_ext(textbox_spr[page], textbox_img_index, _textbox_x, _textbox_y, textbox_width/textbox_spr_width, textbox_height/textbox_spr_height, 0, c_white, 1);
#endregion

#region //Options
//Draw the options if at the end of the dialogue
if(draw_char == text_length[page] && page == page_total - 1) {
	for(var op = 0; op < option_total; op++) {
		//Option Selection
		option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		option_pos = clamp(option_pos, 0, option_total-1);
		
		//Draw the option box
		var _op_width = string_width(option[op]) + op_border*2;
		draw_sprite_ext(textbox_spr[page], textbox_img_index, _textbox_x + 16, _textbox_y - op_sep*option_total + op_sep*op, _op_width/textbox_spr_width, (op_sep-1)/textbox_spr_height, 0, c_white, 1);
		
		//Draw the option selection arrow
		if(option_pos == op) {
			draw_sprite(spr_option_arrow, 0, _textbox_x, _textbox_y - op_sep*option_total + op_sep*op);
		}
		
		//Draw the option text
		draw_text(_textbox_x + 16 + op_border, _textbox_y - op_sep*option_total + op_sep*op + 2, option[op]);
	}
}
#endregion

#region //Draw the text
//var _drawtext = string_copy(text[page], 1, draw_char);
//draw_text_ext(textbox_x + border, textbox_y + border, _drawtext, line_sep, line_width);
for(var c = 0; c < draw_char; c++) {
	//Floating text; increments 'float_dir' and returns y value of 'float_y' as though 'float_dir' is the x value on a sine graph
	var _float_y = 0;
	if(float_text[c, page] == true) {
		float_dir[c, page] += -6;
		_float_y = dsin(float_dir[c, page]);
	}
	
	//Shaking text; picks a random degree and calculates the distance in x and y to put it '1' unit away
	var _shake_x = 0;
	var _shake_y = 0;
	if(shake_text[c, page] == true) {
		shake_timer[c, page]--;
		if(shake_timer[c, page] <= 0) {
			shake_timer[c, page] = irandom_range(4,8);
			shake_dir[c, page] = irandom(360);
		}
		//Only change the characters position in the last 2 ticks of the 'shake_timer'
		if(shake_timer[c, page] <= 2) {
			_shake_x = lengthdir_x(1, shake_dir[c, page]);
			_shake_y = lengthdir_y(1, shake_dir[c, page]);
		}
	}
	
	//Draw each character using the three arrays used to store the x & y coord and the string itself, including set colours
	draw_text_colour(char_x[c, page] + _shake_x, char_y[c, page] + _float_y + _shake_y, char[c, page], colour_1[c, page], colour_2[c, page], colour_3[c, page],colour_4[c, page], 1);
}
#endregion