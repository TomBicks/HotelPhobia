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
		//X coord if no character speaking
		text_x_offset[p] = 0;
	}
}
#endregion

#region //Typing the text
if(draw_char < text_length[page]) {
	//The faster the text speed, the faster the typewriter gets through the characters
	draw_char += text_speed;
	//Make sure 'draw_char' isn't negative or beyond the number of characters we have to draw
	draw_char = clamp(draw_char,0,text_length[page]);
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
textbox_spr_width = sprite_get_width(textbox_spr);
textbox_spr_height = sprite_get_height(textbox_spr);
//Draw back of the textbox (animated background and border)
draw_sprite_ext(textbox_spr, textbox_img_index, _textbox_x, _textbox_y, textbox_width/textbox_spr_width, textbox_height/textbox_spr_height, 0, c_white, 1);
#endregion

#region //Options
//Draw the options if at the end of the dialogue
if(draw_char == text_length[page] && page == page_total - 1) {
	//The seperaton between each option horizontally
	var _op_sep = 15;
	// Space between options and option border vertically
	var _op_border = 8;
	for(var op = 0; op < option_total; op++) {
		//Draw the option box
		var _op_width = string_width(option[op]) + _op_border*2;
		draw_sprite_ext(textbox_spr, textbox_img_index, _textbox_x + 16, _textbox_y - _op_sep*option_total + _op_sep*op, _op_width/textbox_spr_width, (_op_sep-1)/textbox_spr_height, 0, c_white, 1);
		
		//Draw the option text
		draw_text(_textbox_x + 16 + _op_border, _textbox_y - _op_sep*option_total + _op_sep*op + 2, option[op]);
	}
}
#endregion

#region //Draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + border, textbox_y + border, _drawtext, line_sep, line_width);
#endregion