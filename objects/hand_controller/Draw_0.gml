//Username Box
draw_set_valign(fa_middle);
if (image_xscale == 1) {
	draw_sprite_stretched(ui_infoBox,0,x,0,string_width(name)+64,64);
	draw_set_halign(fa_left);
} else {
	draw_sprite_stretched(ui_infoBox,0,x - (string_width(name)+64),0,string_width(name)+64,64);
	draw_set_halign(fa_right);
}
draw_text(x+(32*image_xscale),32,name);

//Leader Image
draw_sprite_ext(ui_character_portrait,0,x,64,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

//Health Bar
for (var h = 0; h < leader_card.max_hp;) {
	draw_sprite_ext(ui_character_generic_bar,clamp(h,0,1),x + (84*image_xscale) + ((h*8)*image_xscale), 68, image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	if (leader_card.hp > h) {
		draw_sprite_ext(ui_character_health_bar,clamp(h,0,1),x + (84*image_xscale) + ((h*8)*image_xscale), 70, image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
	h++
	if h == leader_card.max_hp draw_sprite_ext(ui_character_generic_bar_endcap,0,x + (84*image_xscale) + ((h*8)*image_xscale), 66, image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}