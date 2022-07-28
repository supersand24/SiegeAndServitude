//Tile Scales when hovered over with Mouse.
if (position_meeting(mouse_x,mouse_y, self)) {
	if (scale >= max_scale) {
		scale = max_scale
	} else {
		scale += 0.2;
	}
} else {
	if (scale <= min_scale) {
		scale = min_scale
	} else {
		scale -= 0.5;
	}
}