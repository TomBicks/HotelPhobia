/// @description Insert description here

//Get input;
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

//Increase or decrease position in menu when moving up or down
menu_pos += down_key - up_key;

//Make the menu loop if position would exceed the options avaialble
if(menu_pos >= opt_length) { menu_pos = 0; }
if(menu_pos < 0) { menu_pos = opt_length - 1; }

//Using the options
if(accept_key) {
	switch(menu_pos) {
		//Start Game
		case 0:
			room_goto_next();
			break;
		//Settings
		case 1:
			break;
		//Quit Game
		case 2:
			game_end();
			break;
		default:
			show_error("Option does not exist!", true);
	}
}