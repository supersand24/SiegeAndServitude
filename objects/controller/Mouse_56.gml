/// @description Drop Held Object
//Get the tile the mouse is hovering.
var tileAtMousePos = instance_position(mouse_x,mouse_y,obj_tile);
if (tileAtMousePos != noone) {
	//Get the tile at mouse posistion.
	switch(getSelected()) {
		case SELECTED_TYPE.CARD:
			//Get the tile the mouse is hovering.
			if (tileAtMousePos.setCard(selected)) {
					//Card was able to be played.
					if (player[0].deleteCardInHand(selected)) {
						//Card was deleted, continue game actions.
					} else {
						//Card did not exist in player hand.
					}
			}
		break;
		case SELECTED_TYPE.TILE:
			if (selected.deployed != noone) {
				if (tileAtMousePos.setCard(selected.deployed)) {
						//Card was able to be moved.
						selected.removeCard();
				}
			}
		break;
	}
}

//Forgets what was being held.
selected = noone;