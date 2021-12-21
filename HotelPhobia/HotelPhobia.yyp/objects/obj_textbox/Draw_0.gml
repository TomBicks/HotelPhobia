accept_key = keyboard_check_pressed(vk_space);

//Coords of the textbox in relation to the camera view
textbox_x = camera_get_view_x(view);
textbox_y = camera_get_view_y(view);

#region //Setup
if(!setup) {
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages
	page_amount = array_length(text);
	for(var p = 0; p < page_amount; p++) {
		//Find how many characetrs are on ech page and store that number in the 'text_length' array
		text_length[p] = string_length(text[p]);
		
		//Get the x position for the textbox
		//X coord if no character speaking
		text_x_offset[p] = 0;
	}
}
#endregion

#region//Typing the text
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
		if(page < page_amount-1) {
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
textbox_img_index += textbox_img_speed;
textbox_spr_width = sprite_get_width(textbox_spr);
textbox_spr_height = sprite_get_height(textbox_spr);
//Draw back of the textbox (aniamted background and border)
draw_sprite_ext(textbox_spr, textbox_img_index, textbox_x + text_x_offset[page], textbox_y, textbox_width/textbox_spr_width, textbox_height/textbox_spr_height, 0, c_white, 1);
#endregion

#region //Draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + border, textbox_y + border, _drawtext, line_sep, line_width);
#endregion