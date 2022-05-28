/// @description Initialise important values and create essential objects
//Create camera to correctly size the application surface and window
instance_create_depth(0, 0, 0, obj_camera);

//Create data manager to store save data
instance_create_depth(0, 0, 0, obj_data_manager);

//Move to next room and destroy init object (after enough delay for certain objects to settle; e.g. camera sets app surface)
alarm[0] = 2;