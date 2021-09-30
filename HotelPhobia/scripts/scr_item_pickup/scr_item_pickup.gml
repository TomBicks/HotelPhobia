/// @function		scr_item_pickup();
/// @description	Pickup item (currently just deletes the item)

//If item can reach item manager, indicate this item has been picked up
if(instance_exists(obj_item_manager)) {
	show_debug_message("Picking up item " + identifier);
	ds_map_replace(obj_item_manager.env_item_data, identifier, "picked_up");
}
//Else, something is wrong, as the item should always be able to reach the item manager; throw an error
else {
	show_error("Item could not find Item Manager!", false);
}

//Destroy item object after pickup
instance_destroy(self);