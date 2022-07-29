hand = [];

//Spawn Deck
deck = instance_create_layer(25,35,"Table", obj_pile);

function drawFromDeck(num) {
	drawn = deck.drawCard(num);
	for (var i = 0; i < array_length(drawn); i++) {
		hand[array_length(hand)] = instance_create_layer(-100,-100,"Hand",drawn[i])
		hand[array_length(hand) - 1].index = array_length(hand) - 1
		show_debug_message("Player received a " + string(drawn[i].name) + " from their deck.")
	}
	sortCardHeight();
}

function deleteCardInHand(index) {
	//Destroy the card from the room.
	instance_destroy(hand[index])
	
	//Remove any reference from the array.
	array_delete(hand,index, 1)
	
	//Refresh Index Reference on all cards.
	for (var c = index; c < array_length(hand); c++) {
		hand[c].index = c;
	}
	
	//Resort Card Height
	sortCardHeight();
}

function sortCardHeight() {	
	for (var i = 0; i < array_length(hand); i++) {
		with (hand[i]) {
			x = 10
			y = room_height - (i + 1)*(room_height/(array_length(hand_controller.hand)+1));
		}
	}
}