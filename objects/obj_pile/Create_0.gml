//Initalize Empty Array
stack = [];

//Start deck with generic cards.
//Will probably load cards from a save file on local machine.
var deck_size = DEFAULT_DECK_SIZE;
for (var i = 0; i < deck_size; i++) {
	array_push(stack,0);
}

//Functions

/// @function			drawCard(num);
/// @param {real} num	The number to draw.
function drawCard(num) {
	show_debug_message("Player drew " + string(num) + " card(s) from the " + string(name) + ".")
	//Ready a place for the cards to go.
	var drawnCards = [];
	//For each card
	for (var i = 0; i < num; i++) {
		//Make sure there are cards in the stack.
		if (array_length(stack) > 0) {
			//Save the card drawn
			array_push(drawnCards,getCard(stack[0]))
			//Delete the card from the stack.
			array_delete(stack,0,1);
			
			show_debug_message(string(name) + " has " + string(array_length(stack)) + " cards left.")
		} else {
			show_debug_message(string(name) + " doesn't have enough cards to draw.");
			//ADD DECK OUT WIN CONDITION
			break;
		}
	}
	return drawnCards;
}