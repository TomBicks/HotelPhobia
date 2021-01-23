/// @description Draw outline if player is close enough to interact
if(nearby) {
	shader_set(sha_interact_outline);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	draw_self();
	shader_reset();
} else {
	draw_self();	
}