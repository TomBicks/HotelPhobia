//Inherit initial variables and their values from parent object
event_inherited();

/*NOTE!! What I'm potentially planning for the enviroment item data storage is to have 
the identifier be added to a list with'taken' tacked onto the end ofthe identifier string 
if it has been picked up. Then, when we enter a room, an item checks for its identifier
in the list and checks whether it has 'taken' or not; if not, it continues to exist; if so,
the item destroys itself, having already been 'picked up'.*/

/*NOTE2!! Forget the list? a ds_map might be perfect, as I only need to store one variable
, in the form of a string indicating whether the item is taken or not, and can use the identifier 
to always check fr the correct item every time with no waste; just chuck in the identifier as a 
key and see whether it is taken or not; if it is not even there, add it. if it's taken, destroy; 
if there but 'nottaken', replace with 'taken' value*/

//Define unique string for the item
identifier = object_get_name(object_index) + room_get_name(room) + string(x) + string(y);

#region //Add item to Data Manager's map, check if item exists or destroy it if not
if(instance_exists(obj_data_manager)) {
	with(obj_data_manager) {
		//Get identifier for item
		var _identifier = other.identifier;
	
		//Check if item has already been encountered and added to the list
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
		//If item is not in the list, add it as being still on the ground
		else {
			ds_map_add(env_item_data, _identifier, "on_ground");
			show_debug_message("Item " + _identifier + " encountered for first time; adding to list");
		}
	}
}
else { 
	show_error("Item could not find Data Manager!", false); 
}
#endregion

//Define script to run when object is interacted with
behaviour = scr_item_pickup;