//Temp
global.server = -1;
global.client = -1;

loadCardDatabase();

function spawnCard(playerNum,cardID) {
	return instance_create_layer(-500,-500,"Other",obj_card,
	{
		image_angle : player[playerNum].image_angle,
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

/*
//Spawn the players.
array_push(player,instance_create_layer(0,room_height/2,"Other",hand_controller,{
	playerNum : 0,
	image_xscale : 1,
	image_angle : 270,
	name : "Player 1"
}));
array_push(player,instance_create_layer(room_width,room_height/2,"Other",hand_controller,{
	playerNum : 1,
	image_xscale : -1,
	image_angle : 90,
	name : "Player 2"
}));

//Start Game
startPhase(GAME_PHASE.PREP);
*/