/// @description Insert description here
// You can write your code in this editor
view_width = 0;
view_height = 96;

//The less this value the wider the screen
aspect_ratio = display_get_width()/display_get_height();

//Make width and height match the aspect ratio of the screen
view_width = round(view_height*aspect_ratio);

//Check for odd-numbered width using bitwise operators
/*This works by checking if the first bit in the number is a 1, 
  meaning it is an odd number, as the first bit is the only odd bit*/
if(view_width & 1) { view_width++; }




window_scale = 3;

follow_spd = 0.1;

window_set_size(view_width*window_scale, view_height*window_scale);
//Centre window 1 tick after resizing (cannot be done in the same tick, hence the delay)
alarm[0] = 1; 

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);