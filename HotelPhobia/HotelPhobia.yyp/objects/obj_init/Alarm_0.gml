/// @description Goto next room and destroy init object
//After all data has been obtained, immediately go to the main menu, the next room
room_goto_next();
//Then destroy self, as we no longer need this object
instance_destroy();