//Show held card, if card is held.
//if (selected_card != undefined) {
//	var selected_card_scale = TILE_CARD_MIN_SCALE;
//	draw_sprite_ext(selected.sprite_index,0,mouse_x,mouse_y,selected_card_scale,selected_card_scale,0,c_white,1)
//}

//if (selected != undefined) {
//	with (selected) {
//		draw_circle_color(x, y, 50, c_green, c_green, false);
//		draw_self();
//	}
//}

//Draws currently selected card.
if (selected != noone) {
	var selected_card_scale = TILE_CARD_MIN_SCALE;
	draw_sprite_ext(spr_card,selected.card_id,mouse_x,mouse_y,selected_card_scale,selected_card_scale,0,c_white,1);
}

//Draws Various Text at Bottom of Screen.
draw_set_halign(fa_center);
draw_set_valign(fa_middle)

//Game Phase
switch(phase) {
	case GAME_PHASE.PREP: draw_text(x,(y-50),"PREP PHASE"); break;
	case GAME_PHASE.DRAW: draw_text(x,(y-50),"DRAW PHASE"); break;
	case GAME_PHASE.BUILD: draw_text(x,(y-50),"BUILD PHASE"); break;
	case GAME_PHASE.SUMMON: draw_text(x,(y-50),"SUMMON PHASE"); break;
	case GAME_PHASE.ACTION: draw_text(x,(y-50),"ACTION PHASE"); break;
	case GAME_PHASE.BATTLE: draw_text(x,(y-50),"BATTLE PHASE"); break;
	case GAME_PHASE.RECOVER: draw_text(x,(y-50),"RECOVER PHASE"); break;
}