/// @function					scr_text(text);
/// @param {string}		text	The line to be added to the newly created page of text
/// @description				Add a page of text
function scr_text(_text) {

//Set correct defaults
scr_set_text_defaults();

//Add a page of text at the next page, just after the current 'page_total'
text[page_total] = _text;
//Thus, every time we add a page of text, it increases 'page_total' to reflect the new total of pages
page_total++;

}