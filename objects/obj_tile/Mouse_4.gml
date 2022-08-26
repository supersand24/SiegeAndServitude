/// @description clicked on tile
// You can write your code in this editor

if (movable_to) {
	deployed = controller.selected_tile.deployed;
	
	with (controller.selected_tile) {
	image_xscale = TILE_EMPTY_MAX_SCALE;
	image_yscale = TILE_EMPTY_MAX_SCALE;
	sprite_index = spr_tile;
	min_scale = TILE_EMPTY_MIN_SCALE;
	max_scale = TILE_EMPTY_MAX_SCALE;
	}
	
	
	image_xscale = TILE_CARD_MAX_SCALE;
	image_yscale = TILE_CARD_MAX_SCALE;
	sprite_index = deployed.sprite_index;
	min_scale = TILE_CARD_MIN_SCALE;
	max_scale = TILE_CARD_MAX_SCALE;

	controller.selected_tile.deployed = noone;
}



