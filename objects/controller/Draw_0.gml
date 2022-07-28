/// @description Insert description here
// You can write your code in this editor
var tile_size = 40;
var tile_spacer = 15;

var board_length = (tile_size * 7) + (tile_spacer * 6)

var top_border = 5;
var side_border = room_width/2 - (board_length/2)

draw_set_alpha(0.5)
for (var i = side_border + (tile_size + tile_spacer); i < board_length; i += tile_size + tile_spacer) {
	for (var j = top_border; j < room_height; j += tile_size + tile_spacer) {
		draw_rectangle(i,j,i + tile_size,tile_size + j,false)
	}
}
draw_set_alpha(1)