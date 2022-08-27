//Used to show if highlighting a card.
x_offset = 0;

//Ensures X Offset never goes too far away.
min_x_offset = x_offset;
max_x_offset = 20;

image_xscale = 0.5;
image_yscale = 0.5;

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

//Grabs the id from the object name.
function getId() {
	return real(string_copy(object_get_name(object_index),5,10));
}