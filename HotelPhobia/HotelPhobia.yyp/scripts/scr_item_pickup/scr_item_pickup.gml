/// @function		scr_item_pickup();
/// @description	Pickup item (currently just deletes the item)
function scr_item_pickup() {

	//If item can reach data manager, indicate this item has been picked up
	if(instance_exists(obj_data_manager)) {
	#region //Update state to reflect item has been picked up and so won't appear again
		show_debug_message("Picking up item " + identifier);
		ds_map_replace(obj_data_manager.env_item_data, identifier, "picked_up");
	#endregion
	
	#region //Add item to inventory
		//Set instance variables to local variables, so inventory manager can access them
		var _item_id = self.item_id;
		var _item_amount = self.item_amount;

		//Play item pickup sound
		audio_play_sound(snd_pickup_item, 0, false);

		//Add item to inventory
		with (obj_inv_manager) { scr_inv_add_item(_item_id, _item_amount); }
	#endregion
	}
	//Else, something is wrong, as the item should always be able to reach the data manager; throw an error
	else {
		show_error("Item could not find Data Manager!", false); 
	}

	//Destroy item object after pickup
	instance_destroy(self, false);


}
