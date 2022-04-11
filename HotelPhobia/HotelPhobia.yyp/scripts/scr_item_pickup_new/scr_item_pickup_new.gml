/// @function		scr_item_pickup();
/// @description	Pickup item
function scr_item_pickup_new() {

#region //Add item to inventory
//Set instance variables to local variables, so inventory manager can access them
var _item_id = self.item_id;
var _item_amount = self.item_amount;

//Play item pickup sound
audio_play_sound(snd_pickup_item, 0, false);

//Add item to inventory
with (obj_inv_manager) { scr_inv_add_item(_item_id, _item_amount); }
#endregion

//Destroy item object after pickup
instance_destroy(self, false);

}