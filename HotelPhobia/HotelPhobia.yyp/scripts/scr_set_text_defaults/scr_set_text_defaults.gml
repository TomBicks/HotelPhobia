// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_text_defaults(){

//The position (in characters inward) of each line break, per page
line_break_pos[0, page_total] = 999; //Set default value high so we don't immediately have a line break
//Total number of line breaks on each page
line_break_total[page_total] = 0;
//The width in pixels ??????? 4:05 in part 3; don't get it
line_break_offset[page_total] = 0;
}