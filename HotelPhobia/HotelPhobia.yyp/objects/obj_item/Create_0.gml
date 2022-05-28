//Inherit initial variables and their values from parent object
event_inherited();

//Set default initial variables
item = global.item_list.can; //The ID of the item being picked up
item_amount = 2; //The quantity of the item being picked up

/*Set timer to update image_index after a 1 tick delay 
(enough time for creation code to have ran incase item updates)*/
alarm[0] = 1;

#region //Define script to run when object is interacted with
behaviour = function scr_item_pickup_new() {
	//Play item pickup sound
	audio_play_sound(snd_pickup_item, 0, false);

	//Add item to inventory
	scr_inv_item_add(item, item_amount);
	
	//Destroy item object after pickup
	instance_destroy(self, false);
}
#endregion