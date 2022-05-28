/// @description Insert description here
#region //Define initial variables
//Width & Height of the inventory area
inv_width = 60;
inv_height = 360;

//Width & Height of an inventory slot (both use the same measurement
slot_width = 50;
//Space between inventory slot and the left edge of the inventory
border = 5;
//Seperation between each inventory slot
slot_sep = 10;
//Initial

//Whether or not the inventory is being drawn and responds to interaction
show_inventory = false;
#endregion

#region //Define item types/categories (enum for clarity)
enum item_types {
	none = 0,
	consumable = 1,
	key = 2,
	note = 3
}
#endregion

//Define Item Constructor (used internally to ensure every item struct has the correct variables)
function create_item(_name, _desc, _amount, _ground_spr_index, _inv_spr_index, _type, _effect) constructor {
	name = _name; //Displayed name of the item
	description = _desc; //Displayed description of the item
	amount = _amount; //Displayed amount of the item the player has
	ground_sprite_index = _ground_spr_index; //The image index of the sprite used to showcase the item on the ground
	inventory_sprite_index = _inv_spr_index; //The image index of the sprite used to showcase the item in the inventory
	item_type = _type; //The category of item, used to filter by category in inventory
	item_effect = _effect; //A function attached to the item to trigger upon attempting to 'use' the item
}

#region //Create the item structs
global.item_list = {
	can : new create_item(
		"Can",
		"What's inside?",
		1,
		1,
		1,
		item_types.consumable,
		function() {
			show_message("Heal some health I guess.");
		}
	),
	key : new create_item(
		"Key",
		"I wonder what it unlocks?",
		1,
		2,
		2,
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
		3,
		3,
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
		3,
		3,
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