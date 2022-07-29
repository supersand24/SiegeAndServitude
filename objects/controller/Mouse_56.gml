/// @description Drop Held Card

//Get the tile at mouse posistion.
if (controller.selected_card != undefined) {
	var inst = instance_position(mouse_x,mouse_y,obj_tile)
	if (inst != noone)
	{
		if (inst.deployed == undefined) {
			with (inst) {
				deployed = controller.selected_card;
				scale = TILE_CARD_MAX_SCALE;
				min_scale = TILE_CARD_MIN_SCALE;
				max_scale = TILE_CARD_MAX_SCALE;
			}
			player[selected_card_from].deleteCardInHand(selected_card_from_index);
		}
	}
}

//Discard card from hand, reguardless of where it lands.
selected_card = undefined;
selected_card_from = undefined;
selected_card_from_index = undefined;