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
			controller.player[0].hand[0] = controller.spawnCard(controller.player[0].playerNum, 1);
			controller.player[0].leader_card = controller.player[0].hand[0];
			controller.player[0].sortCardHeight();
		break;
		case GAME_PHASE.DRAW:
			show_debug_message("Draw phase begin.");
			controller.player[0].drawFromDeck(1);
		break;
		case GAME_PHASE.BUILD:
			show_debug_message("Build phase begin.");
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
		break;
	}
}

function endPhase() {
	switch (controller.phase) {
		case GAME_PHASE.PREP:
			controller.player[0].drawFromDeck(7);
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
			//New turn happens here.
		break;
	}	
}