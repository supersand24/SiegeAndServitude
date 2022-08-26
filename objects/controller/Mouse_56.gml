/// @description Drop Held Object

//Get the tile at mouse posistion.
switch(getSelected()) {
	case "obj_card":
	/* NEEDS REWRITTEN
		var inst = instance_position(mouse_x,mouse_y,obj_tile)
		if (inst != noone)
		{
			if (inst.deployed == undefined) {
				with (inst) {
					deployed = controller.selected;
					image_xscale = TILE_CARD_MAX_SCALE;
					image_yscale = TILE_CARD_MAX_SCALE;
					sprite_index = controller.selected.sprite_index;
					min_scale = TILE_CARD_MIN_SCALE;
					max_scale = TILE_CARD_MAX_SCALE;
				}
				player[currentTurn].deleteCardInHand(selected);
			}
		}
	*/
	break;
	case "obj_tile":
	
	break;
}

//Forgets what was being held.
selected = noone;