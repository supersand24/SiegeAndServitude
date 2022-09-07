// @description Cleanup Code

//Delete the Database from Memory
ds_grid_destroy(global.cardDatabase);

//Kill the Server
network_destroy(global.server);
ds_list_destroy(global.player_list);