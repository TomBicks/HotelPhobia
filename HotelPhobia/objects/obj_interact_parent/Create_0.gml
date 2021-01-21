//Create initial variables and their values
empty = false; //Has the object been interact with already and can it be interacted with again?
nearby = false; //Is the object near enough to the player to be interacted with (and have an outline drawn around it)?

//Pass sprite and texture page details to the outline shader
//Tutorial at; https://youtu.be/zWrpHbc6fmc
upixelH = shader_get_uniform(sha_interact_outline, "pixelH");
upixelW = shader_get_uniform(sha_interact_outline, "pixelW");
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));