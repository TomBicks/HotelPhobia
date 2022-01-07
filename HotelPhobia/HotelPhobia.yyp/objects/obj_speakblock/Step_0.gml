if(position_meeting(mouse_x,mouse_y,id) && mouse_check_button_pressed(mb_left)) {
	//Create a textbox at the textbox depth layer
	with(instance_create_depth(0, 0, TEXTBOX_LAYER, obj_textbox)) {
		//Define the text to create this textbox with
		scr_text("This test is a bit different, as it should pop up if we clicked the button.");
		scr_text("Hopefully it all works out fine . . .");
		scr_text("~It'd be a shame if it didn't. #feelsbadman");
	}
}