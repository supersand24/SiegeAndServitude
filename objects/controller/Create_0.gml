function spawnPlayer() {
	var playerNum = array_length(player);
	player[playerNum] = instance_create_layer(0,room_height/2,"Other",hand_controller);
	player[playerNum].playerNum = playerNum;
}

//function to add all tiles in a loop
function createTiles() {
	//center of the room
	var fieldCenterX = room_width/2;
	var fieldCenterY = room_width/2;
	
	var PDBTH = PIXEL_DIFFERENCE_BETWEEN_TILES_HORIZONTAL;
	var PDBTV = PIXEL_DIFFERENCE_BETWEEN_TILES_VERTICAL;
	
	//tile size width offset
	//var TSWO = TILE_EMPTY_SPRITE_WIDTH_OFFSET;
	//var TSWO = (spr_tile.sprite_width *
	var TSHO = TILE_EMPTY_SPRITE_HEIGHT_OFFSET;
	
	//#macro TILE_EMPTY_SPRITE_WIDTH_OFFSET (((spr_tile.sprite_width * TILE_EMPTY_MIN_SCALE)/2));
//#macro TILE_EMPTY_SPRITE_HEIGHT_OFFSET (((spr_tile.sprite_height * TILE_EMPTY_MIN_SCALE)/2));
	
	
	//horizontal displacement for empty tiles
	var hDis = (PDBTH + TSWO);
	
	//vertical displacement for empty tiles
	var vDis = (PDBTV + TSHO); 
	
	
	var startX = fieldCenterX - (hDis * 3);
	var startY = fieldCenterY - (vDis * 3);
	
	var currentX = startX;
	var currentY = startY;
	
	var FW = FIELD_SIZE_WIDTH;
	var FH = FIELD_SIZE_HEIGHT;
	
	for (var i = 0; i < FH; i++) {
		for (var j = 0; j < FW; j++) {
			map[i,j] = instance_create_layer(currentX, currentY, "Tile", obj_tile);
			currentX = currentX + hDis;
		}
		currentY = currentY + vDis;
	}			
}


//adds tiles to the map and the room
createTiles();

//Spawn a player.
spawnPlayer();