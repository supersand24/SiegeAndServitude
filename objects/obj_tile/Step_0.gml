//Tile Scales when hovered over with Mouse.
if (position_meeting(mouse_x,mouse_y, self)) {
	var max_scale;
	if (deployed == noone) {
		var max_scale = TILE_EMPTY_MAX_SCALE;
	} else {
		var max_scale = TILE_CARD_MAX_SCALE;
	}
	if (image_xscale >= max_scale) {
		image_xscale = max_scale
		image_yscale = max_scale
		depth = layer_get_depth(layer_get_id("Table")) - 1;
	} else {
		image_xscale += 0.2;
		image_yscale += 0.2;
	}
} else {
	var min_scale;
	if (deployed == noone) {
		var min_scale = TILE_EMPTY_MIN_SCALE;
	} else {
		var min_scale = TILE_CARD_MIN_SCALE;
	}
	if (image_xscale <= min_scale) {
		image_xscale = min_scale
		image_yscale = min_scale
		depth = layer_get_depth(layer_get_id("Table"));
	} else {
		image_xscale -= 0.5;
		image_yscale -= 0.5;
	}
}