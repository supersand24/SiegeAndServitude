image_xscale = 0.5;
image_yscale = 0.5;

image_angle = 270;

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

function getTitleLine() {
	var str = controller.player[owner].name;
	str += " | ";
	str += name;
	switch(type) {
		case CARD_TYPE.LEADER:		str += " | Leader Card | Movement: "; break;
		case CARD_TYPE.UNIT:		str += " | Unit Card | Movement:"; break;
		case CARD_TYPE.STRUCTURE:	str += " | Structure Card | Movement:"; break;
		case CARD_TYPE.SPELL:		str += " | Spell Card | Movement:"; break;
		case CARD_TYPE.EQUIP:		str += " | Equipment Card | Movement:"; break;
	}
	str += string(movement);
	str += " | Range: "
	str += string(range);
	return str;
}

function getStatLine() {
	var str = string(hp);
	str += "/";
	str += string(max_hp);
	str += " HP | ";
	str += string(atk);
	str += " Attack | ";
	str += string(def);
	str += " Defense | ";
	str += string(magDef);
	str += " Magic Defense";
	return str;
}