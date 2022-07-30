/// @description Pick up Cards

if (controller.currentTurn == owner) {
	controller.selected_card = self;
	controller.selected_card_from = owner;
	controller.selected_card_from_index = index;
}