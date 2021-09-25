/// @description Insert description here
// You can write your code in this editor

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


var identifier = room_get_name(room) + object_get_name(object_index) + string(x) + string(y);

with(obj_item_manager) {
	//Check if item has already been encountered and added to the list
	var result = ds_map_find_value(env_item_data, identifier);
	
	//If item is already picked up, destroy it, as it has already been picked up
	if(!is_undefined(result)) {
		if(result == "picked_up") { 
			instance_destroy(other); 
			show_debug_message("Item " + identifier + " already picked up; destroying item");
		}
		else {
			show_debug_message("Item " + identifier + " still on ground; leaving as is");
		}
	}
	//If item is not in the list, add it as being still on the ground
	else {
		ds_map_add(env_item_data, identifier, "on_ground");
		show_debug_message("Item " + identifier + " encountered for first time; adding to list");
	}
}