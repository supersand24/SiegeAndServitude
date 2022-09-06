//Sets the font in the cent
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draws currently selected card.
if (selected != noone) {
	var selected_card_scale = TILE_CARD_MIN_SCALE;
	draw_sprite_ext(spr_card,selected.card_id,mouse_x,mouse_y,selected_card_scale,selected_card_scale,0,c_white,1);
	draw_text(x,y-35,selected.getTitleLine());
	draw_text(x,y-15,selected.getStatLine());
} else {
	var card = instance_position(mouse_x,mouse_y,obj_card);
	if (card != noone) {
		draw_text(x,y-40,card.getTitleLine());
		draw_text(x,y-20,card.getStatLine());
	}
}

//Current Player's Turn & Game Phase
switch(phase) {
	case GAME_PHASE.PREP: draw_text(x,32, string(player[currentTurn].name) + "'s Prep Phase"); break;
	case GAME_PHASE.DRAW: draw_text(x,32, string(player[currentTurn].name) + "'s Draw PHASE"); break;
	case GAME_PHASE.BUILD: draw_text(x,32, string(player[currentTurn].name) + "'s Build Phase"); break;
	case GAME_PHASE.SUMMON: draw_text(x,32, string(player[currentTurn].name) + "'s Summon Phase"); break;
	case GAME_PHASE.ACTION: draw_text(x,32, string(player[currentTurn].name) + "'s Action Phase"); break;
	case GAME_PHASE.BATTLE: draw_text(x,32, string(player[currentTurn].name) + "'s Battle Phase"); break;
	case GAME_PHASE.RECOVER: draw_text(x,32,string(player[currentTurn].name) + "'s Recover Phase"); break;
}