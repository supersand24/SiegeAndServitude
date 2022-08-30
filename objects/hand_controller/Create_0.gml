playerNum = undefined;

hand = [];

handBoundsTop = 125;
handBoundsBot = room_height-75;

function drawFromDeck(num = 1) {
	drawn = deck.drawCard(num);
	for (var i = 0; i < array_length(drawn); i++) {
		array_push(hand,controller.spawnCard(playerNum,drawn[i]));
		show_debug_message(string(name) + " received a " + string(drawn[i].name) + " from their " + string(deck.name) + ".")
	}
	sortCardHeight();
}

function discardToDiscardPile(card) {
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
			card.image_angle = 0;
			//Resort Card Height
			sortCardHeight();
			return true;
		}
	}
	return false;
}

function sortCardHeight() {
	var len = array_length(hand);
	if (len > 0) {
		if (len == 1) {
			hand[0].y = (handBoundsBot-handBoundsTop)/2 + handBoundsTop;
			hand[0].x = 5;
		} else {
			for (var i = 1; i < len+1; i++) {
				hand[i-1].y = handBoundsTop + (handBoundsBot-handBoundsTop)/(len+1)*i;
				hand[i-1].x = 5;
			}
		}
	}
}

//Spawn Deck, and give deck cards.
deck = instance_create_layer(5,room_height-5,"Table", obj_pile);
deck.name = "Deck";
with (deck) {
	var deck_size = DEFAULT_DECK_SIZE;
	for (var i = 0; i < deck_size; i++) {
		//array_push(stack,0);
		//controller.spawnCard(playerNum, 0);
	}
}

//Spawn Discard
discard = instance_create_layer(50,room_height-5,"Table",obj_pile);
discard.name = "Discard Pile"

//Spawn Leader
hand[0] = controller.spawnCard(playerNum, 1);
//hand[0] = CARD_LOCATION.HAND;
sortCardHeight();