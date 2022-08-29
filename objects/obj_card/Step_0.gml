if (position_meeting(mouse_x,mouse_y, self)) {
	if (x_offset >= max_x_offset) {
		x_offset = max_x_offset
	} else {
		x_offset += 2;
	}
} else {
	if (x_offset <= min_x_offset) {
		x_offset = min_x_offset
	} else {
		x_offset -= 3;
	}
}