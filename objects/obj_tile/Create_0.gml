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
	//If not forcing card to space, return if space is already occupied.
	if (!forced) {
		if deployed != noone return false;
	}
	if (card.location != undefined) {
		controller.map[card.map_x,card.map_y].deployed = noone;
	}
	deployed = card;
	card.x = x;
	card.y = y;
	card.map_x = map_x;
	card.map_y = map_y;
	card.location = CARD_LOCATION.FIELD;
	updateSprite();
	controller.player[card.owner].deleteCardInHand(card);
	return true;
}

function removeCard() {
	deployed = noone;
	updateSprite();
}

function updateSprite() {
	if (deployed == noone) {
		//sprite_index = spr_tile;
		image_xscale = TILE_EMPTY_MAX_SCALE;
		image_yscale = TILE_EMPTY_MAX_SCALE;
		min_scale = TILE_EMPTY_MIN_SCALE;
		max_scale = TILE_EMPTY_MAX_SCALE;
	} else {
		//sprite_index = asset_get_index("card" + string(deployed.card_id));
		image_xscale = TILE_CARD_MAX_SCALE;
		image_yscale = TILE_CARD_MAX_SCALE;
		min_scale = TILE_CARD_MIN_SCALE;
		max_scale = TILE_CARD_MAX_SCALE;
	}
}