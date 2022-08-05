/// @description Drop Held Card

//Get the tile at mouse posistion.
if (selected_card != undefined) {
	var inst = instance_position(mouse_x,mouse_y,obj_tile)
	if (inst != noone)
	{
		if (inst.deployed == undefined) {
			with (inst) {
				deployed = controller.selected_card;
				image_xscale = TILE_CARD_MAX_SCALE;
				image_yscale = TILE_CARD_MAX_SCALE;
				sprite_index = controller.selected_card.sprite_index;
				min_scale = TILE_CARD_MIN_SCALE;
				max_scale = TILE_CARD_MAX_SCALE;
				
				if (deployed.type == CARD_TYPE.LEADER) {
					show_debug_message("Leader Card was placed!");
				}
			}
			player[selected_card_from].deleteCardInHand(selected_card_from_index);
		}
	}
}

//Discard card from hand, reguardless of where it lands.
selected_card = undefined;
selected_card_from = undefined;
selected_card_from_index = undefined;