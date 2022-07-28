/// @description Insert description here
// You can write your code in this editor

cards = 0;

function addCard() {
	if (is_array(cards)) {
		cards[array_length(cards)] = instance_create_layer(-100,-100,"Hand",obj_card)
	} else {
		cards[0] = instance_create_layer(-100,-100,"Hand",obj_card)
	}
	show_debug_message("Player received a card.")
}