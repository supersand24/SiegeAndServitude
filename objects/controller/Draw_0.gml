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

//Draw Text at Bottom of Screen.
draw_set_halign(fa_center);
draw_set_valign(fa_middle)

switch(phase) {
	case GAME_PHASE.PREP: draw_text(x,(y-50),"PREP PHASE"); break;
}

if (selected == noone) {
	draw_text(x,y-30,"Nothing Selected.");
} else {
	draw_text(x,y-30,getSelected());
	draw_text(x,y-10,selected);
}