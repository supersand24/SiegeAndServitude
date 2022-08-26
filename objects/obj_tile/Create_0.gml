//card in the tile
deployed = noone;

//Used to show if highlighting a tile.
image_xscale = TILE_EMPTY_MIN_SCALE;
image_yscale = TILE_EMPTY_MIN_SCALE;

//Ensures Scale never gets too big/small.
min_scale = TILE_EMPTY_MIN_SCALE;
max_scale = TILE_EMPTY_MAX_SCALE;

//map location
map_x = undefined;
map_y = undefined;

movable_to = false;

function movable(bool) {
	if (bool == undefined) {
		movable_to = !movable_to;
	} else {
		movable_to = bool;
	}
	if (movable_to) {
		image_blend = c_yellow;
	} else {
		image_blend = c_white;
	}
}

function setCard(card,forced = false) {
	deployed = card;
	image_xscale = TILE_CARD_MAX_SCALE;
	image_yscale = TILE_CARD_MAX_SCALE;
	min_scale = TILE_CARD_MIN_SCALE;
	max_scale = TILE_CARD_MAX_SCALE;
	sprite_index = card.sprite_index;
}