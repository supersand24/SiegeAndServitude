switch (async_load[? "type"]) {
	case network_type_connect:
	
		var socket = async_load[? "socket"]
		ds_list_add(global.player_list, socket);
		
		//Sync the client with the host data.
		var username = buffer_create(1028, buffer_fixed, 1);
		buffer_write(username, buffer_u8, 0);
		buffer_write(username, buffer_string, player[0].name);
		network_send_packet(socket, username, buffer_get_size(username));
		buffer_delete(username);
		
		//Create new hand controller here, as a client.
		array_push(controller.player,instance_create_layer(room_width,room_height/2,"Other",hand_controller,{
			name : "sqKweglord",
			playerNum : 1,
			image_xscale : -1,
			image_angle : 90,
			connection_type : CONNECTION_TYPE.CLIENT
		}));
		
		//Start Game
		startPhase(GAME_PHASE.PREP);
	break;
	
	case network_type_disconnect:
		ds_list_delete(global.player_list, ds_list_find_index(global.player_list, async_load[? "socket"]));
	break;
	
	case network_type_data:
		var buffer = async_load[? "buffer"];
		
		buffer_seek(buffer, buffer_seek_start, 0);
		
		var data = buffer_read(buffer, buffer_u8);
		
		switch(data) {
			case 0:
				room_goto_next();
				connected_player_names = [buffer_read(buffer, buffer_string)];
			break;
		}
	break;
}