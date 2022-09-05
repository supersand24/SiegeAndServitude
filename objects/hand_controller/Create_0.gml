playerNum = undefined;

hand = [];

handBoundsTop = 125;
handBoundsBot = room_height-75;

function drawFromDeck(num = 1) {
	drawn = deck.drawCard(num);
	for (var i = 0; i < array_length(drawn); i++) {
		var card = controller.spawnCard(playerNum,drawn[i]);
		card.owner = playerNum;
		array_push(hand,card);
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
			hand[0].x = x+5;
		} else {
			for (var i = 1; i < len+1; i++) {
				hand[i-1].y = handBoundsTop + (handBoundsBot-handBoundsTop)/(len+1)*i;
				hand[i-1].x = x+5;
			}
		}
	}
}

//Spawn Deck, and give deck cards.
deck = instance_create_layer(x+(25*image_xscale),room_height-5,"Table", obj_pile);
deck.name = "Deck";
with (deck) {
	var deck_size = DEFAULT_DECK_SIZE;
	for (var i = 0; i < deck_size; i++) {
		//array_push(stack,round(clamp(random(6),1,6)));
		array_push(stack,1);
	}
}

//Spawn Discard
discard = instance_create_layer(x+(70*image_xscale),room_height-5,"Table",obj_pile);
discard.name = "Discard Pile"