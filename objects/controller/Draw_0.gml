//Show held card, if card is held.
if (selected_card != undefined) {
	var selected_card_scale = TILE_CARD_MIN_SCALE;
	draw_sprite_ext(spr_card,0,mouse_x,mouse_y,selected_card_scale,selected_card_scale,0,c_white,1)
}