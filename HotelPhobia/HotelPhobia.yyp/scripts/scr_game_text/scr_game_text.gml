/// @function						scr_game_text(text_id);
/// @param {string}		text_id		The id of the set of dialogue to be retrieved
/// @description					Retrieve a set of dialogue using its unique 'text_id'
function scr_game_text(_text_id){

switch(_text_id) {
	#region //NPC 1
	case("npc 1"):
		scr_text("Hi, I'm NPC 1!", "cynthia");
			scr_text_colour(8, 12, c_blue, c_blue, c_blue, c_blue);
		scr_text("Hopefully it all works out fine . . .", "kim", -1);
			scr_text_float(0, 8);
		scr_text("Do you think it will work?", "cynthia");
			scr_text_shake(3,5);
			scr_option("Yes, I do.", "npc 1 - yes");
			scr_option("No, not really.", "npc 1 - no");
		break;
	case("npc 1 - yes"):
		scr_text("Yeah, I think it will too!", "cynthia");
		scr_text("I doubt it. You're free to hope though...", "kim", -1);
		break;
	case("npc 1 - no"):
		scr_text("Oh, well that's unfortunate.", "kim", -1);
		scr_text("I hope you end up changing your mind.", "cynthia");
		break;
	#endregion
	#region //NPC 2
	case("npc 2"):
		scr_text("Hi, I'm NPC 2!");
		scr_text("Hopefully I work better than that other guy.");
		scr_text("...Though I don't really mind either way. I think?");
		scr_text("Then again, I could go on and on about how this very-much-so coding textbox can write really big; like ginomrous lines out.");
		break;
	#endregion
	default:
		show_error(" No such Text ID exists!",false);
		break;
}

}