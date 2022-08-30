/// @description Click in Room

//Reset the movable state of all tiles in the room.
for (var i = 0; i < array_length(map); i++) {
	for (var j = 0; j < array_length(map[i]); j++) {
		map[i,j].movable(false);
	}
}