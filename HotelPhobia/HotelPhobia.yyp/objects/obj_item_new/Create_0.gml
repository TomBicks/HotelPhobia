//Inherit initial variables and their values from parent object
event_inherited();

//Create initial variables and their values for the child object
item = global.item_list.can; //The ID of the item being picked up
//sprite_index = item.sprite; //The sprite of the item being picked up
item_amount = 2; //The quantity of the item being picked up

#region //Define script to run when object is interacted with
behaviour = function scr_item_pickup_new() {
	//Play item pickup sound
	audio_play_sound(snd_pickup_item, 0, false);

	//Add item to inventory
	scr_inv_add_item_new(item, item_amount);
	
	//Destroy item object after pickup
	instance_destroy(self, false);
}
#endregion