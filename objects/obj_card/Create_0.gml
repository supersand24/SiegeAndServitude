//current card selected by player
selected_card = undefined;

//Used to show if highlighting a card.
x_offset = 0;

//Ensures X Offset never goes too far away.
min_x_offset = x_offset;
max_x_offset = 20;

//card type enum
enum CARD_TYPE {
	LEADER,
	UNIT,
	STRUCTURE,
	SPELL,
	EQUIP
}

//card effect enum
enum CARD_EFFECTS {	
}

//weapon skill enum
enum WEAPON_SKILLS {
}