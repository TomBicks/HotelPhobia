/// @function						scr_game_text(text_id);
/// @param {string}		text_id		The id of the set of dialogue to be retrieved
/// @description					Retrieve a set of dialogue using its unique 'text_id'
function scr_game_text(_text_id){

switch(_text_id) {
	#region //NPC 1
	case("npc 1"):
		scr_text("Hi, I'm NPC 1!");
		scr_text("Hopefully it all works out fine . . .");
		scr_text("Do you think it will work?");
			scr_option("Yes, I do.", "npc 1 - yes");
			scr_option("No, not really.", "npc 1 - no");
		break;
	case("npc 1 - yes"):
		scr_text("Yeah, I think it will too!");
		break;
	case("npc 1 - no"):
		scr_text("Oh, well that's unfortunate.");
		scr_text("I hope you end up changing your mind.");
		break;
	#endregion
	#region //NPC 2
	case("npc 2"):
		scr_text("Hi, I'm NPC 2!");
		scr_text("Hopefully I work better than that other guy.");
		scr_text("...Though I don't really mind either way. I think?");
		break;
	#endregion
	default:
		show_error(" No such Text ID exists!",false);
		break;
}

}