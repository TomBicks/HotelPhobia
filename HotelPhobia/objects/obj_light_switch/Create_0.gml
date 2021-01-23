//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
//switch_on = false; //Is the switch activated and the output on?
//target = -1; //By default no target light is elected

//NOTE!! COULD STILL HAVE THESE IN CREATE EVENT AND RUN
//NEW INSTANCE VARIABLES THROUGH CREATION CODE IN ROOM INSTANCES

//Define script to run when object is interacted with
behaviour = scr_light_switch;

//Set light object to match switch object's state, in case they do not
if(instance_exists(target)) {
	target.light_on = switch_on;
}