//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
item_id = inv_items.can; //The ID of the item being picked up
item_amount = 1; //The quantity of the item being picked up

//Define unique string for the item
identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);

#region //Add item to Data Manager's map, check if item exists or destroy it if not
if(instance_exists(obj_data_manager)) {
	with(obj_data_manager) {
		//Get identifier for item
		var _identifier = other.identifier;
	
		//Check if item has already been encountered and added to the map
		var _result = ds_map_find_value(env_item_data, _identifier);
	
		//If item is already picked up, destroy it, as it has already been picked up
		if(!is_undefined(_result)) {
			if(_result == "picked_up") { 
				instance_destroy(other); 
				show_debug_message("Item " + _identifier + " already picked up; destroying item");
			}
			else {
				show_debug_message("Item " + _identifier + " still on ground; leaving as is");
			}
		}
		//If item is not in the map, add it as being still on the ground
		else {
			ds_map_add(env_item_data, _identifier, "on_ground");
			show_debug_message("Item " + _identifier + " encountered for first time; adding to map");
		}
	}
}
else { 
	show_error("Item could not find Data Manager!", false); 
}
#endregion

//Define script to run when object is interacted with
behaviour = scr_item_pickup;