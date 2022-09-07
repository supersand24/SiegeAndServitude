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

if (global.server >= 0) {
	array_push(controller.player,instance_create_layer(0,room_height/2,"Other",hand_controller,{
		playerNum : 0,
		image_xscale : 1,
		image_angle : 270,
		name : "Player 1",
		connection_type : CONNECTION_TYPE.HOST
	}));
}