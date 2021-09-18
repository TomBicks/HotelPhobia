/// @description Move Player Right
// Move player right, stopping at right room border
x = clamp(x + 4, sprite_width/2, room_width-(sprite_width/2));
