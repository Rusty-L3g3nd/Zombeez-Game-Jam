// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//to do add player 2 sprites to check these functions

function movementAnimationChoice(characterChoice){
	if(characterChoice==1){
		if(moveDir != 0){
		sprite_index = spr_pc1_running_11;
		image_xscale = moveDir;
		}else{
			sprite_index = spr_pc1_standing_11;
		};
	}
	
}

function jumpAnimationChoice(characterChoice){
	if(characterChoice==1){
		sprite_index = spr_pc1_jmp;
		image_index = 1;
	}
}


/*
not needed i think
function shootingAnimationChoice(characterChoice){
	if(characterChoice==1){
	}
}

*/