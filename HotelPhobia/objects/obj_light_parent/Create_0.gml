/// @description Create initial variables and their values
light_on = false; //Is the light object currently on and producing light?

/*Thinking for the sprite could simply have the first subimage be
the off sprite and the second be the on sprite, thus meaning I
simply need to change the image_index to 0 or 1 to have the sprite
reflect if the light is on or off, regardless of the object and it's
sprites (so long as they have sub-images 0 and 1 to swap between)*/

/*Thinking for the lights to have the object pass to a shader the
colour, radius, width (360 degrees around or thin 25 degrees) and
angle (pointing straight down or 90 degrees to the right) and thus 
allow for customisation between lights using only one light shader*/