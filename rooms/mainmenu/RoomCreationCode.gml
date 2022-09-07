instance_create_depth(room_width/2,room_height,0,controller);

instance_create_layer(50,50,"Buttons",obj_menu_button,{
	name : "Local Mode",
	action : function() { room_goto_next(); }
})

instance_create_layer(50,100,"Buttons",obj_menu_button,{
	name : "Host Game",
	action : function() { 
		//Server Variables
		global.port = 2424;
		
		global.server = network_create_server(network_socket_tcp, global.port, 2);
		global.player_list = ds_list_create();

		if (global.server < 0) {
			show_message("Error creating server.");
			game_restart();
		} else {
			room_goto_next();
		}
	}
})

instance_create_layer(50,150,"Buttons",obj_menu_button,{
	name : "Join Game",
	action : function() { 
		//Server Variables
		global.port = 2424;
		global.ip = "127.0.0.1";

		network_set_config(network_config_connect_timeout, 3000);
		global.client = network_create_socket(network_socket_tcp);
		network_connect(global.client, global.ip, global.port);

		if (global.client < 0) {
			show_message("Error connecting to server.");
			game_restart();
		} else {
			room_goto_next();
		}
	}
})