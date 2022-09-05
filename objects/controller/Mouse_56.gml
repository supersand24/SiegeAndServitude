/// @description Drop Held Object

//If holding onto a card.
if (selected != noone) {
	//See if the card trying to be played is in the right phase.
	if (canPlayCardInCurrentPhase(selected)) {
		//Get the tile the mouse is hovering.
		var tileAtMousePos = instance_position(mouse_x,mouse_y,obj_tile);
		if (tileAtMousePos != noone) {
			//If not forcing card to space, return if space is already occupied.
			if (tileAtMousePos.deployed == noone) {
				if (selected.location != undefined) {
					controller.map[selected.map_x,selected.map_y].deployed = noone;
				}
				tileAtMousePos.deployed = selected;
				selected.x = tileAtMousePos.x;
				selected.y = tileAtMousePos.y;
				selected.map_x = tileAtMousePos.map_x;
				selected.map_y = tileAtMousePos.map_y;
				selected.location = CARD_LOCATION.FIELD;
				controller.player[selected.owner].deleteCardInHand(selected);
			}
		}
	}
	//Forgets what was being held.
	selected = noone;
}