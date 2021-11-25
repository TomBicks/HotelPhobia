/// @description Move Player Left
// Move player left, stopping at left room border
x = clamp(x - 4, sprite_width/2, room_width-(sprite_width/2));
