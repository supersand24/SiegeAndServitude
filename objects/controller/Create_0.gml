//Is the instance id of a selected item.
selected = noone;

enum GAME_PHASE {
	PREP
}

enum SELECTED_TYPE {
	NOTHING,
	CARD,
	TILE
}

phase = GAME_PHASE.PREP;

loadCardDatabase();

function spawnPlayer() {
	var playerNum = array_length(player);
	player[playerNum] = instance_create_layer(0,room_height/2,"Other",hand_controller);
	player[playerNum].playerNum = playerNum;
}

function spawnCard(playerNum,cardID) {
	//return instance_create_layer(-500,-500,"Hand",getCard(card));
	return instance_create_layer(-500,-500,"Other",obj_card,
	{
		card_id : cardID,
		name : global.cardDatabase[# 0, cardID],
		type : global.cardDatabase[# 1, cardID],
		movement : real(global.cardDatabase[# 2, cardID]),
		hp : real(global.cardDatabase[# 3, cardID]),
		max_hp : real(global.cardDatabase[# 3, cardID]),
		atk : real(global.cardDatabase[# 4, cardID]),
		base_atk : real(global.cardDatabase[# 4, cardID]),
		def : real(global.cardDatabase[# 5, cardID]),
		base_def : real(global.cardDatabase[# 5, cardID]),
		magDef : real(global.cardDatabase[# 6, cardID]),
		base_magDef : real(global.cardDatabase[# 6, cardID])
	});
}

//function to add all tiles in a loop
function createTiles() {
	//center of the room
	var fieldCenterX;
	if (room_width%2 == 0) {
		fieldCenterX = room_width/2;
	} else {
		fieldCenterX = round(room_width/2);
	}
	
	var fieldCenterY;
	if (room_height%2 == 0) {
		fieldCenterY = room_height/2;
	} else {
		fieldCenterY = round(room_height/2);
	}
	
	//show_debug_message("ROOM_CENTER = " + string(fieldCenterX) + "," + string(fieldCenterY));
	
	var PDBTH = PIXEL_DIFFERENCE_BETWEEN_TILES_HORIZONTAL;
	var PDBTV = PIXEL_DIFFERENCE_BETWEEN_TILES_VERTICAL;
	
	var TEMS = TILE_EMPTY_MIN_SCALE;
	var TH = TILE_EMPTY_HEIGHT;
	var TW = TILE_EMPTY_WIDTH;
	
	//tile size width offset
	var TSWO = ((TW * TEMS)/2);
	//tiles size height offset
	var TSHO = ((TH * TEMS)/2);
	
	//horizontal displacement for empty tiles
	var hDis = (PDBTH + TSWO);
	
	//vertical displacement for empty tiles
	var vDis = (PDBTV + TSHO); 
	
	//the cordinates to start at
	var startX = fieldCenterX - (hDis * 2);
	var startY = fieldCenterY - (vDis * 2);
	
	var currentX = startX;
	var currentY = startY;
	
	var FW = FIELD_SIZE_WIDTH;
	var FH = FIELD_SIZE_HEIGHT;
	
	for (var i = 0; i < FH; i++) {
		for (var j = 0; j < FW; j++) {
			map[i,j] = instance_create_layer(currentX, currentY, "Table", obj_tile);
			map[i,j].map_x = i;
			map[i,j].map_y = j;
			currentX = currentX + hDis;
		}
		currentY = currentY + vDis;
		currentX = startX;
	}	
	
	createBackLine(fieldCenterX,fieldCenterY, hDis, vDis);
}

function createBackLine(fieldCenterX, fieldCenterY, hDis, vDis) {
	var borderHorDisplace = hDis * 3;
	var verticalDis = vDis + 22.5;
	
	bordStartX = fieldCenterX - borderHorDisplace;
	bordStartY = fieldCenterY - verticalDis;
	
	currentX = bordStartX;
	currentY = bordStartY;
	
	for (var i = 0; i < 3; i++) {
		for (var j = 0; j < 2; j++) {
			border[i,j] = instance_create_layer(currentX, currentY, "Table", obj_tile);
			border[i,j].map_x = i;
			border[i,j].map_y = j;
			currentX = fieldCenterX + borderHorDisplace;
		}
		currentY = currentY + verticalDis;
		currentX = bordStartX;
	}
	
}
	
//Spawn a player.
spawnPlayer();

//adds tiles to the map and the room
createTiles();

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