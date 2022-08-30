draw_sprite_stretched(ui_infoBox,0,0,0,string_width(name)+64,64);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(32,32,name);
draw_sprite_ext(ui_character_portrait,0,x,64,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Health Bar
for (var h = 0; h < leader_card.max_hp; h++) {
	draw_sprite(ui_character_generic_bar,clamp(h,0,1),x + 84 + (h*8), 68);
	if (leader_card.hp > h) {
		draw_sprite(ui_character_health_bar,clamp(h,0,1),x + 84 + (h*8), 70);
	}
	if (h == (leader_card.max_hp - 1)) draw_sprite(ui_character_generic_bar_endcap,0,x + 84 + ((h+1)*8), 66);
}