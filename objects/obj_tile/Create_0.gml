//card in the tile
deployed = undefined;

//Used to show if highlighting a tile.
image_xscale = TILE_EMPTY_MIN_SCALE;
image_yscale = TILE_EMPTY_MIN_SCALE;

//Ensures Scale never gets too big/small.
min_scale = TILE_EMPTY_MIN_SCALE;
max_scale = TILE_EMPTY_MAX_SCALE;

show_debug_message(string(image_xscale) + " X")
show_debug_message(string(image_yscale) + " Y")

//map location
map_x = undefined
map_y = undefined