//Show held card, if card is held.
if (selected_card != undefined) {
	var selected_card_scale = TILE_CARD_MIN_SCALE;
	draw_sprite_ext(selected_card.sprite_index,0,mouse_x,mouse_y,selected_card_scale,selected_card_scale,0,c_white,1)
}

if (showInfoBox) {
	draw_set_color(c_black);
	if (infoBox != undefined) {
		draw_text(mouse_x,mouse_y,infoBox.name);
	}
}

if (selected_tile != undefined) {
	with (selected_tile) {
		draw_circle_color(x, y, 50, c_green, c_green, false);
		draw_self();
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle)

switch(phase) {
	case GAME_PHASE.PREP: draw_text(x,(y-50),"PREP PHASE"); break;
}