/// @description Insert description here
// You can write your code in this editor
view_width = 1920/6;
view_height = 1080/6;

window_scale = 3;

follow_spd = 0.1;

window_set_size(view_width*window_scale, view_height*window_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);