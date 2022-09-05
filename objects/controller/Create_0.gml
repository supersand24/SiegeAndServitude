loadCardDatabase();

function spawnCard(playerNum,cardID) {
	return instance_create_layer(-500,-500,"Other",obj_card,
	{
		owner : playerNum,
		card_id : cardID,
		name : global.cardDatabase[# 0, cardID],
		type : real(global.cardDatabase[# 1, cardID]),
		movement : real(global.cardDatabase[# 2, cardID]),
		range : real(global.cardDatabase[# 3, cardID]),
		hp : real(global.cardDatabase[# 4, cardID]),
		max_hp : real(global.cardDatabase[# 4, cardID]),
		atk : real(global.cardDatabase[# 5, cardID]),
		base_atk : real(global.cardDatabase[# 5, cardID]),
		def : real(global.cardDatabase[# 6, cardID]),
		base_def : real(global.cardDatabase[# 6, cardID]),
		magDef : real(global.cardDatabase[# 7, cardID]),
		base_magDef : real(global.cardDatabase[# 7, cardID])
	});
}

//Spawn the players.
array_push(player,instance_create_layer(0,room_height/2,"Other",hand_controller,{
	playerNum : 0,
	image_xscale : 1,
	name : "Player 1"
}));
array_push(player,instance_create_layer(room_width,room_height/2,"Other",hand_controller,{
	playerNum : 1,
	image_xscale : -1,
	name : "Player 2"
}));

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
var startX = room_width/2 - (hDis * 2);
var startY = room_height/2 - (vDis * 2);
	
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
	
//The Backline AKA Command Post
var borderHorDisplace = hDis * 3;
var verticalDis = vDis + 22.5;
	
var bordStartX = room_width/2 - borderHorDisplace;
var bordStartY = room_height/2 - verticalDis;
	
currentX = bordStartX;
currentY = bordStartY;
	
for (var i = 0; i < 3; i++) {
	for (var j = 0; j < 2; j++) {
		border[i,j] = instance_create_layer(currentX, currentY, "Table", obj_tile);
		border[i,j].map_x = i;
		border[i,j].map_y = j;
		currentX = room_width/2 + borderHorDisplace;
	}
	currentY = currentY + verticalDis;
	currentX = bordStartX;
}

//Start Game
startPhase(GAME_PHASE.PREP);

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