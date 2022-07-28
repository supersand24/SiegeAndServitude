//Draw self, with extra steps.
if (deployed == undefined) {
	draw_sprite_ext(spr_tile,0,x,y,scale,scale,0,c_white,0.5)
} else {
	draw_sprite_ext(spr_card,0,x,y,0.5,0.5,0,c_white,1)
}