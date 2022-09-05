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

//Draws Various Text at Bottom of Screen.
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
		draw_text(x,y-35,card.getTitleLine());
		draw_text(x,y-15,card.getStatLine());
	}
}

//Current Player's Turn
draw_text(x,y - (room_height-20), string(player[currentTurn].name) + "'s turn.");

//Game Phase
switch(phase) {
	case GAME_PHASE.PREP: draw_text(x,(y-55),"PREP PHASE"); break;
	case GAME_PHASE.DRAW: draw_text(x,(y-55),"DRAW PHASE"); break;
	case GAME_PHASE.BUILD: draw_text(x,(y-55),"BUILD PHASE"); break;
	case GAME_PHASE.SUMMON: draw_text(x,(y-55),"SUMMON PHASE"); break;
	case GAME_PHASE.ACTION: draw_text(x,(y-55),"ACTION PHASE"); break;
	case GAME_PHASE.BATTLE: draw_text(x,(y-55),"BATTLE PHASE"); break;
	case GAME_PHASE.RECOVER: draw_text(x,(y-55),"RECOVER PHASE"); break;
}