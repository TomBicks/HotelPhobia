/// @description Insert description here

#region // Check for interactable objects nearby
if(instance_exists(obj_interact_parent)) {
	var _nearby_interact = instance_nearest(x, y, obj_interact_parent);
	if(distance_to_object(_nearby_interact) < interact_range) {
		with (obj_interact_parent) {
			if(self == _nearby_interact) {
				nearby = true;
				if(keyboard_check_pressed(vk_up)) {
					script_execute(behaviour);	
				}
			} else {
				nearby = false;
			}
		}
	} else {
		_nearby_interact.nearby = false;
	}
}
#endregion