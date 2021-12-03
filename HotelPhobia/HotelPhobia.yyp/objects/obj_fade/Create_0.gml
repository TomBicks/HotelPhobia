/// @description Initialise variables

//Get dimensions of the camera view visible to the player
width = camera_get_view_width(view);
height = camera_get_view_height(view);

show_debug_message(width);
show_debug_message(height);
show_debug_message(surface_get_width(application_surface));
show_debug_message(surface_get_height(application_surface));