/// @description Change Window Zoom
zoom++;

//If zoom would exceed display's bounds, reset to minimum zoom
if(zoom > max_zoom) { zoom = min_zoom; }

window_set_size(view_width*zoom, view_height*zoom);

alarm[0] = 1;