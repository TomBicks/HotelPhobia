/// @description Calculate fade in and out
// You can write your code in this editor
if(fading_out) {
	image_alpha += fade_out_speed;
	if(image_alpha >= 1) { 
		image_alpha = 1;
		room_goto(target_room);
		alarm_set(0,1); //Set player coords after 1 tick delay
		fading_out = false;
	}
}
else {
	image_alpha -= fade_in_speed;
	if(image_alpha <= 0) { 
		image_alpha = 0;
		instance_destroy();
	}
}