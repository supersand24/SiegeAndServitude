//Tile Scales when hovered over with Mouse.
if (position_meeting(mouse_x,mouse_y, self)) {
	var max_scale;
	if (deployed == undefined) {
		var max_scale = TILE_EMPTY_MAX_SCALE;
	} else {
		var max_scale = TILE_CARD_MAX_SCALE;
	}
	if (scale >= max_scale) {
		scale = max_scale
	} else {
		scale += 0.2;
	}
} else {
	var min_scale;
	if (deployed == undefined) {
		var min_scale = TILE_EMPTY_MIN_SCALE;
	} else {
		var min_scale = TILE_CARD_MIN_SCALE;
	}
	if (scale <= min_scale) {
		scale = min_scale
	} else {
		scale -= 0.5;
	}
}