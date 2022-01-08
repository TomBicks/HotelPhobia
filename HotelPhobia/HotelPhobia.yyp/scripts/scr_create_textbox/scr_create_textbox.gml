/// @function						scr_game_text(text_id);
/// @param {string}		text_id		The id of the set of dialogue to be retrieved
/// @description					Create a textbox, using the set of dialogue retrieved using a unique 'text_id'
function scr_create_textbox(_text_id){
	//Create the textbox at the textbox depth layer
	with(instance_create_depth(0, 0, TEXTBOX_LAYER, obj_textbox)) {
		//Retrieve the text to create this textbox with
		scr_game_text(_text_id)
	}
}