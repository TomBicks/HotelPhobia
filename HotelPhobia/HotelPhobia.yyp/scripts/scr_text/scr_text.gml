/// @function					scr_text(text);
/// @param {string}		text	The line to be added to the newly created page of text
/// @description				Add a page of text
function scr_text(_text) {

//Set correct defaults
scr_set_text_defaults();

//Add a page of text at the next page, just after the current 'page_total'
text[page_total] = _text;

//Return the character portrait and border to use for that page of text (returns noone by default)
if(argument_count > 1) {
	switch(argument[1]) {
		#region //Cynthia Portraits
		case("cynthia"):
			speaker_sprite[page_total] = spr_cynthia;
			textbox_spr[page_total] = spr_menu;
			speaker_sound[page_total] = snd_voice_mid;
			break;
		case("cynthia-happy"):
			speaker_sprite[page_total] = spr_cynthia;
			textbox_spr[page_total] = spr_menu;
			speaker_sound[page_total] = snd_voice_mid;
			break;
		#endregion
		#region //Kim Portraits
		case("kim"):
			speaker_sprite[page_total] = spr_kim;
			textbox_spr[page_total] = spr_menu;
			speaker_sound[page_total] = snd_voice_low;
			break;
		case("kim-happy"):
			speaker_sprite[page_total] = spr_kim;
			textbox_spr[page_total] = spr_menu;
			speaker_sound[page_total] = snd_voice_low;
			break;
		#endregion
	}
}

//Determine which side the character portrait is on
if(argument_count > 2) {
	speaker_side[page_total] = argument[2];
}

//Thus, every time we add a page of text, it increases 'page_total' to reflect the new total of pages
page_total++;

}