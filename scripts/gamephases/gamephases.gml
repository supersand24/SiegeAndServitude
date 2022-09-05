enum GAME_PHASE {
	PREP,  //Used to place leader cards, and get intial draw.
	DRAW,  //At start of a turn, player draws a card.
	BUILD,  //Player can start building a structure card, or progress an existing structure.
	SUMMON, //Player can place a card from one of their structure/leader cards.
	ACTION,  //All movement and declaring attacks happen here.
	BATTLE,  //This is only used for combat, after a battle go back to action phase.
	RECOVER  //This is after the player uses all of their effects, any at end of turn effects happen, and the turn is swapped over to the other player.
}

function startPhase(phase) {
	if !is_numeric(phase) return;
	controller.phase = phase;
	switch (phase) {
		case GAME_PHASE.PREP:
			show_debug_message("Prep phase begin.");
			for (var i = 0; i < array_length(controller.player); i++) {
				var card = controller.spawnCard(i,0);
				controller.player[i].hand[0] = card;
				controller.player[i].leader_card = card;
				controller.player[i].sortCardHeight();
			}
		break;
		case GAME_PHASE.DRAW:
			show_debug_message("Draw phase begin.");
			controller.player[controller.currentTurn].drawFromDeck(1);
			endPhase();
		break;
		case GAME_PHASE.BUILD:
			show_debug_message("Build phase begin.");
			for (var i = 0; i < array_length(controller.player[controller.currentTurn].hand); i++) {
				if array_get(controller.player[controller.currentTurn].hand,i).type == CARD_TYPE.STRUCTURE return;
			}
			endPhase();
		break;
		case GAME_PHASE.SUMMON:
			show_debug_message("Summon phase begin.");
		break;
		case GAME_PHASE.ACTION:
			show_debug_message("Action phase begin.");
		break;
		case GAME_PHASE.BATTLE:
			show_debug_message("Battle phase begin.");
		break;
		case GAME_PHASE.RECOVER:
			show_debug_message("Recover phase begin.");
			endPhase();
		break;
	}
}

function endPhase() {
	switch (controller.phase) {
		case GAME_PHASE.PREP:
			for (var i = 0; i < array_length(controller.player); i++) {
				controller.player[i].drawFromDeck(7);
			}
			startPhase(GAME_PHASE.DRAW);
		break;
		case GAME_PHASE.DRAW:
			startPhase(GAME_PHASE.BUILD);
		break;
		case GAME_PHASE.BUILD:
			startPhase(GAME_PHASE.SUMMON);
		break;
		case GAME_PHASE.SUMMON:
			startPhase(GAME_PHASE.ACTION);
		break;
		case GAME_PHASE.ACTION:
			startPhase(GAME_PHASE.RECOVER);
		break;
		case GAME_PHASE.BATTLE:
			startPhase(GAME_PHASE.ACTION);
		break;
		case GAME_PHASE.RECOVER:
			if (controller.currentTurn < array_length(controller.player) - 1)
				controller.currentTurn++;
			else
				controller.currentTurn = 0;
			startPhase(GAME_PHASE.DRAW);
		break;
	}	
}

function canPlayCardInCurrentPhase(card) {
	switch (card.type) {
		case CARD_TYPE.LEADER: if controller.phase != GAME_PHASE.PREP return false; else {
			if (controller.currentTurn < array_length(controller.player) - 1)
				controller.currentTurn++;
			else {
				controller.currentTurn = 0;
				endPhase();
			}
		} break;
		case CARD_TYPE.UNIT: if controller.phase != GAME_PHASE.SUMMON return false; else endPhase(); break;
		case CARD_TYPE.STRUCTURE: if controller.phase != GAME_PHASE.BUILD return false; else endPhase(); break;
		case CARD_TYPE.EQUIP: if controller.phase != GAME_PHASE.ACTION return false; else endPhase(); break;
	}
	return true;
}