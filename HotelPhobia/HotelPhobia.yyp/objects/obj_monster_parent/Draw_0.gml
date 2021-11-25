/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_orange);

draw_text(x,y-20,counter);
draw_text(x,y-40,alarm_get(0));
draw_text(x,y-60,ai_state);

draw_rectangle(x+(dir_facing*sight_min), y+15, x+(dir_facing*sight_max), y+20, true);
draw_set_color(c_red);
draw_rectangle(x+(dir_facing*sight_min), y+15, x+(dir_facing*attack_range), y+20, true);