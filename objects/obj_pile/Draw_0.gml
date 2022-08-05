//Draw Card
draw_sprite_ext(spr_card_back,0,x,y,0.5,0.5,image_angle,image_blend,image_alpha);

//Draw Stack Number
draw_set_halign(fa_center);
draw_text(x+20,y-20,array_length(stack));

//Draw Stack Name
//draw_text(x+20,y-80,name);