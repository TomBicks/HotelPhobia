/// @description Insert description here
#region //Define item types/categories (enum for clarity)
enum item_types {
	none = 0,
	consumable = 1,
	key = 2,
	note = 3
}
#endregion

//Define Item Constructor (used internally to ensure every item struct has the correct variables)
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
		spr_item_ground,
		item_types.consumable,
		function() {
			show_message("Heal some health I guess.");
		}
	),
	key : new create_item(
		"Key",
		"I wonder what it unlocks?",
		1,
		spr_item_ground,
		item_types.key,
		function() {
			//Basically just check for a specific type of door here and it nearby unlock it
			show_message("Unlocks the door it leads to.");
		}
	),
	note1 : new create_item(
		"Note 1",
		"The first note.",
		1,
		spr_item_ground,
		item_types.note,
		function() {
			//Spawn a textbox and read out the note
			show_message("This is the first note of x amount.");
		}
	),
	note2 : new create_item(
		"Note 2",
		"The second note.",
		1,
		spr_item_ground,
		item_types.note,
		function() {
			//Spawn a textbox and read out the note
			show_message("This is the second note of x amount.");
		}
	)
}
#endregion

#region //Create the inventory
inventory = array_create(0);

//array_push(inventory, global.item_list.can);
#endregion