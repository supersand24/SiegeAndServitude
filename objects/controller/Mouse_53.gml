/// @description click in room
// You can write your code in this editor
for (var i = 0; i < array_length(map); i++) {
	for (var j = 0; j < array_length(map[i]); j++) {
		map[i,j].movable(false);
	}
}
var inst = instance_position(mouse_x, mouse_y, obj_tile);

if (inst != undefined) {
	selected_tile = inst;
} else {
	selected_tile = undefined;
}





