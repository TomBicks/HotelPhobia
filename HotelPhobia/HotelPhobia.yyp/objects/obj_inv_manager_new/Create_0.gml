/// @description Insert description here
#region //Define item types/categories (enum for clarity)
enum item_types {
	none = 0,
	consumable = 1,
	key = 2,
	note = 3
}
#endregion

//Define Item Constructor
function create_item(_name, _desc, _amount, _spr, _type, _effect) constructor {
	name = _name;
	description = _desc;
	amount = _amount;
	sprite = _spr;
	item_type = _type;
	item_effect = _effect;
}

#region //Create the item structs
global.item_list = {
	can : new create_item(
		"Can",
		"What's inside?",
		1,
		spr_item_can,
		item_types.consumable,
		function() {
			show_message("Heal some health I guess.");
		}
	),
	key : new create_item(
		"Key",
		"I wonder what it unlocks?",
		1,
		spr_item_can,
		item_types.key,
		function() {
			//Basically just check for a specific type of door here and it nearby unlock it
			show_message("Unlocks the door it leads to.");
		}
	)
}
#endregion

#region //Create the inventory
inventory = array_create(0);

//array_push(inventory, global.item_list.can);
#endregion