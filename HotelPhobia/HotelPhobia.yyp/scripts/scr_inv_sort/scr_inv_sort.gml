// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inv_sort(_item_1, _item_2){
show_message("Yes.");
//If both item's types match, then need to instead sort alphabetically by item name
if(_item_1.item_type == _item_2.item_type) {
	return _item_1.name - _item_2.name;
}
//If both item's types don't match, sort numerically by item type
else {
	show_debug_message("Item's types match: sorting Item 1's type of " + string(_item_1.item_type) + " against Item 2's type of " + string(_item_2.item_type));
	return _item_1.item_type - _item_2.item_type;
}

}