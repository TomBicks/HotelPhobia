/// @description DEBUG!!! Draw Window Size
//Draw rectangle to showcase what is needed to draw to the dimensions of the window for the GUI
draw_set_color(c_red);
draw_rectangle(1, 1, surface_get_width(application_surface)-2, surface_get_height(application_surface)-2, true);

//Showcase all the variables and info needed to determine what values use
draw_text(0,0,"Width: " + string(view_width));
draw_text(0,20,"Height: " + string(view_height));
draw_text(0,40,"Zoom: " + string(zoom));
draw_text(0,60,"Width * Zoom: " + string(view_width*zoom));
draw_text(0,80,"Height * Zoom: " + string(view_height*zoom));
draw_text(0,100,"Application Surface Width: " + string(surface_get_width(application_surface)));
draw_text(0,120,"Application Surface Height: " + string(surface_get_height(application_surface)));

//Draw boxes in all 4 corners of the GUI for future reference
var _gui_width = surface_get_width(application_surface);
var _gui_height = surface_get_height(application_surface);
	
draw_rectangle(0, 0, 10, 10, false); //Top Left
draw_rectangle(_gui_width - 10, 0, _gui_width, 10, false); //Top Right
draw_rectangle(0, _gui_height-10, 10, _gui_height, false); //Bottom Left
draw_rectangle(_gui_width - 10, _gui_height-10, _gui_width, _gui_height, false); //Bottom Right