//Show held card, if card is held.
if (selected_card != undefined) {
	var selected_card_scale = TILE_CARD_MIN_SCALE;
	draw_sprite_ext(spr_card,0,mouse_x,mouse_y,selected_card_scale,selected_card_scale,0,c_white,1)
}

if (showInfoBox) {
	draw_set_color(c_black);
	if (infoBox != undefined) {
		draw_text(mouse_x,mouse_y,infoBox.name);
	}
}