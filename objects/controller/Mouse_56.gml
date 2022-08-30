/// @description Drop Held Object
//Get the tile the mouse is hovering.
if (selected != noone) {
	var tileAtMousePos = instance_position(mouse_x,mouse_y,obj_tile);
	if (tileAtMousePos != noone) {
		//Get the tile the mouse is hovering.
		if (tileAtMousePos.setCard(selected)) {
			//Card was able to be played.
			if (player[0].deleteCardInHand(selected)) {
				//Card was deleted, continue game actions.
				switch(phase) {
					case GAME_PHASE.PREP:
						player[0].drawFromDeck(7);
					break;
				}
			} else {
				//Card did not exist in player hand.
			}
		}
	}

	//Forgets what was being held.
	selected = noone;
}