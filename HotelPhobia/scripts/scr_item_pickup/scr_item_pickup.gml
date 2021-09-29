/// @function		scr_item_pickup();
/// @description	Pickup item (currently just deletes the item)

if(instance_exists(obj_item_manager)) {
	ds_map_replace(obj_item_manager.env_item_data, identifier, "picked_up");
}
else {
	show_error("Item could not find Item Manager!", false);
}

instance_destroy(self);