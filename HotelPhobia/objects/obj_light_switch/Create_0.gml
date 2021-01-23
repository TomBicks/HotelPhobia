//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
switch_on = false; //Is the switch activated and the output on?
target = -1; //By default no target light is elected

//Define script to run when object is interacted with
behaviour = scr_light_switch;