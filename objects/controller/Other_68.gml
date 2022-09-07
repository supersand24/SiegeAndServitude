switch (async_load[? "type"]) {
	case network_type_connect:
	
		var socket = async_load[? "socket"]
		ds_list_add(global.player_list, socket);
		
		//Sync the client with the host data.
		var username = buffer_create(1028, buffer_fixed, 1);
		
		buffer_write(username, buffer_u8, 0);
		buffer_write(username, buffer_string, "supersand24");
		
		network_send_packet(socket, username, buffer_get_size(username));
		buffer_delete(username);
		
		//Create new hand controller here, as a client.
		
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
				var username = buffer_read(buffer, buffer_string);
				show_message(username);
			break;
		}
	break;
}