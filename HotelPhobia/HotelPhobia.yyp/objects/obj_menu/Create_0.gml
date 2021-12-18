/// @description Define Menu Properties & Options
#region //Menu Sections
//Main Menu
option[0,0] = "Start Game";
option[0,1] = "Settings";
option[0,2] = "Quit Game";

//Settings Menu
option[1,0] = "Test 1";
option[1,1] = "Test 2";
option[1,2] = "Test 3";
option[1,3] = "Back";
#endregion

// Dimensions of the menu's borders (dynamically set in the alarm after a delay)
width = 0;
height = 0;

// Space between options and menu border
opt_border = 8;
// Space between options
opt_spacing = 16;

//Current position (option selected) on the menu
menu_pos = 0;

//Determine what level of the menu the user is on (level is x where option[x, y] )
menu_level = 0;
//Set the length of the current level's array of options
opt_length = array_length(option[menu_level]);

//Dynamically calculate initial height and width after a delay
alarm_set(0, 2);

//Centre initial menu after a delay
alarm_set(1, 2);