/// @function							scr_text_shake(first_char, last_char)
/// @param {string}		first_char		The first character to set a shaking effect between
/// @param {string}		last_char		The last character to set a shaking effect between
/// @description						Set a range of text to have a shaking effect, from 'first_char' to 'last_char'
function scr_text_shake(_first_char, _last_char) {
	
//Set all characters between first_char and last_char to shake
for(var c = _first_char; c <= _last_char; c++) {
	shake_text[c, page_total-1] = true;
}

}