/// @description Insert description here
// You can write your code in this editor
for(i = 0; i < array_length(inventory); i++) {
	draw_text(0, 15*i, string(inventory[i].name) + string(inventory[i].amount));
}