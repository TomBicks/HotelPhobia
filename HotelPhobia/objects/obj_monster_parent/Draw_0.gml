/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_orange);

draw_text(x,y-20,counter);
draw_text(x,y-40,ai_state);

draw_rectangle(x, y+15, x+(dir_facing*sight_range), y+20, true);