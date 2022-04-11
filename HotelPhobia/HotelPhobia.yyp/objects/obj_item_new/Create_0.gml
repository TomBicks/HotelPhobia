//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
item = global.item_list.can; //The ID of the item being picked up
item_amount = 2; //The quantity of the item being picked up

#region //Define script to run when object is interacted with
behaviour = function scr_item_pickup_new() {
	//Add item to inventory
	//Set instance variables to local variables, so inventory manager can access them
	var _item_id = self.item_id;
	var _item_amount = self.item_amount;

	//Play item pickup sound
	audio_play_sound(snd_pickup_item, 0, false);

	//Add item to inventory
	with (obj_inv_manager) { scr_inv_add_item(_item_id, _item_amount); }

	//Destroy item object after pickup
	instance_destroy(self, false);
}
#endregion