function unit_move() {
	if (selected != undefined) {
		if (selected.deployed != undefined) {
			
			var temp_tile;
			var start_x = selected.map_x;
			var start_y = selected.map_y;
	
			for (var i = 0; i < 3; i++) {
				var x_dif;
				switch (i) {
					case 0:
					x_dif = -1;
					break;
					case 1:
					x_dif = 0;
					break;
					case 2:
					x_dif = 1;
					break;
				}
				for (var j = 0; j < 3; j++) {
					var y_dif;
					switch (j) {
						case 0:
							y_dif = -1;
						break;
						case 1:
							y_dif = 0;
						break;
						case 2:
							y_dif = 1;
						break;
					}
					try {
						temp_tile = map[start_x+x_dif, start_y+y_dif];
						if (temp_tile != selected) {
							temp_tile.movable(true);
						}
					} catch (error) {
						show_debug_message("tried to check for off screen tiles");
					}
				}
			}

		}
	}
}