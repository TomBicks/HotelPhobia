//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
item_id = inv_items.can; //The ID of the item being picked up
item_amount = 1; //The quantity of the item being picked up

//Define script to run when object is interacted with
behaviour = scr_item_pickup;