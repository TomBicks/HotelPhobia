/// @function					scr_get_identifier(object);
/// @param {real}	object		A reference to the object to create an identifier with
/// @description				Generate a unique indentifier string for the given object
function scr_get_identifier(_object) {

//Generate identifier
var _identifier = object_get_name(_object.object_index)+","+room_get_name(room)+","+string(x)+","+string(y);

return _identifier;

}