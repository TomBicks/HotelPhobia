/// @function							scr_text_colour(first_char, last_char, colour_1, colour_2, coluor_3, colour_4);
/// @param {string}		first_char		The first character to set a colour between
/// @param {string}		last_char		The last character to set a colour between 
/// @param {colour}		colour_1		First colour from the top-left corner
/// @param {colour}		colour_2		Second colour from the top-right corner
/// @param {colour}		colour_3		Third colour from the bottom-right corner
/// @param {colour}		colour_4		Fourth colour from the bottom-left corner
/// @description						Set a range of text to a set colour, from 'first_char' to 'last_char'
function scr_text_colour(_first_char, _last_char, _colour_1, _colour_2, _colour_3, _colour_4){

//NOTE!! Maybe should have this either 1 colour or check for arguments have have it default to 1 colour?
//Set all characters between first_char and last_char to desired colour
for(var c = _first_char; c <= _last_char; c++) {
	colour_1[c, page_total-1] = _colour_1; //Top Left Colour
	colour_2[c, page_total-1] = _colour_2; //Top Right Colour
	colour_3[c, page_total-1] = _colour_3; //Bottom Right Colour
	colour_4[c, page_total-1] = _colour_4; //Bottom Left Colour
}

}