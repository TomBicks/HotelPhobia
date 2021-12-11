/// @description Initialise variables

//Get dimensions of the game window; the area visible to the player
width = window_get_width();//camera_get_view_width(view);
height = window_get_height();//camera_get_view_height(view);

//Initialise the timer and colour for the fade fade out to black effect, negative means fade in from black
fade_out_speed = 0.025;
fade_in_speed = 0.025;
fade_color = c_black;

//Is the fader fading out to black? If not, it's fading in from black
fading_out = true;
image_alpha = 0;