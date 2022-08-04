//card in the tile
deployed = undefined;

//Used to show if highlighting a tile.
image_xscale = TILE_EMPTY_MIN_SCALE;
image_yscale = TILE_EMPTY_MIN_SCALE;

//Ensures Scale never gets too big/small.
min_scale = TILE_EMPTY_MIN_SCALE;
max_scale = TILE_EMPTY_MAX_SCALE;

//For animating the info box to zoom out.
infoBox_scale = 5;
infoBox_max_scale = 5;

//map location
map_x = undefined;
map_y = undefined;

movable_to = false;

function movable(bool) {
	if (bool == undefined) {
	movable_to = !movable_to;
	}
	else {
		movable_to = bool;
	}
	if (movable_to) {
		image_blend = c_yellow;
	} else {
		image_blend = c_white;
	}
	
}
		