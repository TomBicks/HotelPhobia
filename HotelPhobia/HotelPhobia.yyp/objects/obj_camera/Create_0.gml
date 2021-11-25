/// @description Initialise variables
#region //Determing initial window size and aspect ratio
//Set initial ideal height of the window, e.g. 96 will display 96 pixels tall)
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
#endregion

#region //Initialise Zoom
//Value determining the min the window can be zoomed (i.e. the least it can be shrunk)
min_zoom = 3;

//Value determining the max the window can be zoomed before it would not fit the dispaly
max_zoom = floor(display_get_width()/view_width);

//Value determining how zoomed in the window currently is
zoom = min_zoom;
#endregion

//Speed camera tracks the player when moving
follow_spd = 0.1;

window_set_size(view_width*min_zoom, view_height*min_zoom);
//Centre window 1 tick after resizing (cannot be done in the same tick, hence the delay)
alarm[0] = 1; 

surface_resize(application_surface, view_width*min_zoom, view_height*min_zoom);