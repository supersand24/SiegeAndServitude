if (revealed) {
	draw_sprite_ext(spr_card,card_id,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
} else {
	draw_sprite_ext(spr_card_back,0,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}