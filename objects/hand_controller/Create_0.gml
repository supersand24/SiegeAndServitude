playerNum = undefined;

hand = [];

function drawFromDeck(num) {
	if (num == undefined) num = 1;
	drawn = deck.drawCard(num);
	for (var i = 0; i < array_length(drawn); i++) {
		hand[array_length(hand)] = controller.spawnCard(playerNum,drawn[i]);
		hand[array_length(hand) - 1].index = array_length(hand) - 1
		show_debug_message(string(name) + " received a " + string(drawn[i].name) + " from their " + string(deck.name) + ".")
	}
	sortCardHeight();
}

function discardToDiscardPile() {
	var discarding = [hand[0]]
	discard.addCards(discarding);
	deleteCardInHand(0);
}

//Deletes the Game Object and the reference in Player Hand, and also resorts the card height.
//Returns true, if the operation was successful.
//Returns false, if the card could not be found in the player hand.
function deleteCardInHand(card) {
	for (var i = 0; i < array_length(hand); i++) {
		if (card.id == hand[i].id) {
			//Remove the reference from the hand array.
			array_delete(hand,i,1);
			//Delete the Game Object
			instance_destroy(card);
			//Resort Card Height
			sortCardHeight();
			return true;
		}
	}
	return false;
}

function sortCardHeight() {	
	for (var i = 0; i < array_length(hand); i++) {
		with (hand[i]) {
			x = 10
			y = room_height - (i + 1)*(room_height/(array_length(hand_controller.hand)+1)) + 150;
		}
	}
}

//Spawn Deck, and give deck cards.
deck = instance_create_layer(5,room_height-5,"Table", obj_pile);
deck.name = "Deck";
with (deck) {
	var deck_size = DEFAULT_DECK_SIZE;
	for (var i = 0; i < deck_size; i++) {
		array_push(stack,0);
	}
}

//Spawn Discard
discard = instance_create_layer(50,room_height-5,"Table",obj_pile);
discard.name = "Discard Pile"

//Spawn Leader
hand[0] = controller.spawnCard(playerNum, 1);
hand[0].index = 0;
sortCardHeight();