/// @description Insert description here
//NOTE!! Assuming 6 is the max number of slots
slot_selected_visual = clamp(slot_selected_visual + 1,1,6);

/*//Test 1
//If current visual slot is the last slot of the UI...
if(slot_selected_visual == 6) {
	//..and current actual slot is not the last in the inventory
	if(slot_selected_actual < array_length(inventory)) {
		//Move down a slot
		slot_selected_actual++;
	}
}
//If current visual slot is not the last slot of the UI
else {
	if(slot_selected_actual < array_length(inventory)) {
		//Move down a slot
		slot_selected_actual++;
	}
}
*/

//Test 2
//If current actual slot is NOT the last in the inventory
if(slot_selected_actual < array_length(inventory)) {
	//Move down a slot, actually
	slot_selected_actual++;
	
	//If current visual slot is NOT the last slot of the UI, move down visually as well
	if(slot_selected_visual < 6) {
		//Move down a slot, actually, but NOT visually
		slot_selected_visual++;
	}
}