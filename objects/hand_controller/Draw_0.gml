draw_sprite_stretched(ui_infoBox,0,0,0,string_width(name)+64,64);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(32,32,name);
draw_sprite_ext(ui_character_portrait,0,x,64,image_xscale,image_yscale,image_angle,image_blend,image_alpha);