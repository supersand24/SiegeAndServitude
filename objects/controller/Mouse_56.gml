/// @description Drop Held Object

//Get the tile at mouse posistion.
switch(getSelected()) {
	case SELECTED_TYPE.CARD:
		//Get the tile the mouse is hovering.
		var tileAtMousePos = instance_position(mouse_x,mouse_y,obj_tile)
		if (tileAtMousePos != noone) {
			tileAtMousePos.setCard(selected);
			//Delete card from player hand.
		}
	break;
	case SELECTED_TYPE.TILE:
	
	break;
}

//Forgets what was being held.
selected = noone;