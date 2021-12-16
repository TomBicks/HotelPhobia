/// @description Insert description here

//Get input;
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_enter);

//Store number of options in current menu level
//opt_length = array_length(option[menu_level]);

//Increase or decrease position in menu when moving up or down
menu_pos += down_key - up_key;

//Make the menu loop if position would exceed the options avaialble
if(menu_pos >= opt_length) { menu_pos = 0; }
if(menu_pos < 0) { menu_pos = opt_length - 1; }

#region //Using the options
if(accept_key) {
	//Store the initial menu level in case the level changes during a loop
	var _init_level = menu_level;
	
	switch(menu_level) {
		//Main Menu
		case 0:
			switch(menu_pos) {
				//Start Game
				case 0:
					room_goto_next();
					break;
				//Settings
				case 1:
					menu_level = 1;
					break;
				//Quit Game
				case 2:
					game_end();
					break;
				default:
					show_error("Option does not exist!", true);
			}
		
		//Settings Menu
		case 1:
			switch(menu_pos) {
				//Test 1
				case 0:
					break;
				//Test 2
				case 1:
					break;
				//Test 3
				case 2:
					break;
				//Back
				case 3:
					menu_level = 0;
					break;
				default:
					show_error("Option does not exist!", true);
			}
		
		//If menu level has changed since the start of the loop
		if(_init_level != menu_level) {
			//Set position to 0
			menu_pos = 0;
			//Update number of options in current menu level
			opt_length = array_length(option[menu_level]);
		}
	}
}
#endregion