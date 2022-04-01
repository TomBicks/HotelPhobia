/// @function							scr_text_float(first_char, last_char)
/// @param {string}		first_char		The first character to set a float effect between
/// @param {string}		last_char		The last character to set a float effect between
/// @description						Set a range of text to have a floating effect, from 'first_char' to 'last_char'
function scr_text_float(_first_char, _last_char) {
	
//Set all characters between first_char and last_char to float
for(var c = _first_char; c <= _last_char; c++) {
	float_text[c, page_total-1] = true;
}

}