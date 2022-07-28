cards = [];

function addCard() {
	cards[array_length(cards)] = instance_create_layer(-100,-100,"Hand",obj_card)
	show_debug_message("Player received a card.")
	sortCardHeight()
}

function sortCardHeight() {	
	for (var i = 0; i < array_length(cards); i++) {
		with (cards[i]) {
			x = 10
			y = room_height - (i + 1)*(room_height/(array_length(hand_controller.cards)+1));
		}
	}
}