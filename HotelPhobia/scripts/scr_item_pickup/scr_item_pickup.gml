/// @function		scr_item_pickup();
/// @description	Adds an item to the inventory, then sorts it by ID


//Set instance variables to local variables, so inventory controller can access them
var item_id = self.item_id;
var item_amount = self.item_amount;

//Play item pickup sound
audio_play_sound(snd_pickup_item, 0, false);

//Add item to inventory
with (obj_inv_controller) {
	scr_inv_add_item(item_id, item_amount);
}

//Delete object item pickup after adding item to inventory
instance_destroy(self, false);