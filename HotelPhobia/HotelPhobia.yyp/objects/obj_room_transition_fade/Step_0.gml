/// @description Calculate fade in and out
// You can write your code in this editor
if(fading_out) {
	image_alpha += fade_out_speed;
	if(image_alpha >= 1) { 
		image_alpha = 1;
		room_goto(target_room);
		obj_player.x = target_x;
		obj_player.y = target_y;
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