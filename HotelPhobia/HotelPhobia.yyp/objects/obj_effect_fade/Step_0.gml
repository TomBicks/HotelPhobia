/// @description Calculate fade in and out
// You can write your code in this editor
if(fading_out) {
	image_alpha += fade_out_speed;
	if(image_alpha >= 1) { 
		image_alpha = 1;
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