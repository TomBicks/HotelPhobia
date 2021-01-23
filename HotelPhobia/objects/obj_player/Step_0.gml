/// @description Insert description here
// Check for interactable objects nearby
var nearby_interact = instance_nearest(x, y, obj_interact_parent);
if(distance_to_object(nearby_interact) < interact_range) {
	with (obj_interact_parent) {
		if(self == nearby_interact) {
			nearby = true;
		} else {
			nearby = false;
		}
	}
} else {
	nearby_interact.nearby = false;
}