/// @function						sound_event(sound_x, sound_y, sound_radius, sound_effect);
/// @param {real}	sound_x			The X coordinate of the sound's location
/// @param {real}	sound_y			The Y coordinate of the sound's location
/// @param {real}	sound_radius	The radius in which the sound can be heard by zombies
/// @param {id}		sound_effect	The sound to play for the event
/// @description					Play a sound and attract zombies in a certain radius to the source


#region //Set arguments to local variables
//X & Y coordinates of sound location
var sound_x = argument0;
var sound_y = argument1;

//Strength of the sound; determines the volume and radius of the area the sound is heard
var sound_strength = argument2;

//Radius of the area the sound is heard; the further from the centre, the quieter the noise
var sound_radius = sound_strength*10; //NOTE!! Maybe temporary

//Sound effect played for the sound event
var sound_effect = argument3;
#endregion


#region //Play sound effect, get all zombies in sound_radius, then set them to follow the sound
//Play sound that causes the sound event
audio_play_sound(sound_effect, 10, false);

//Create list for all zombies within sound's radius to hear
var _zomb_list = ds_list_create();

//Get total no. of zombies affected and populate the list with said zombies
var _total = collision_circle_list(sound_x, sound_y, sound_radius, obj_zombie, false, true, _zomb_list, true);

//If there are zombies affected, ...
if(_total > 0) { //...set each zombies sound source coordinats to the affecting sound's coordinates
	for(var i = 0; i < _total; i++;) {
		var cur_zomb = _zomb_list[| i]; //Access zombie from the list and set it to current zombie
		cur_zomb.interest = cur_zomb.interest_max; //Set zombie interest to its max
		cur_zomb.sound_x = sound_x; //Set X coord of the sound source zombie will follow
		cur_zomb.sound_y = sound_y; //Set Y coord of the sound source zombie will follow
	}
}

//Delete list once we are done with it
ds_list_destroy(_zomb_list);
#endregion