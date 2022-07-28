/// @description Drop Held Card

//Get the tile at mouse posistion.
var inst = instance_position(mouse_x,mouse_y,obj_tile)
if (inst != noone)
{
    inst.deployed = selected_card;
}

//Discard card from hand, reguardless of where it lands.
selected_card = undefined;