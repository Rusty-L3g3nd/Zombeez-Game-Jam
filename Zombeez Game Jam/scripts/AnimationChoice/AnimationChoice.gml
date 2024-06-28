// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//to do add player 2 sprites to check these functions

function runAnim(characterChoice = 1, weaponChoice1 = 0, weaponChoice2 = 0){
	var animDataRun = [
	[spr_pc1_running_pistol, spr_pc1_running_uzi, spr_pc1_running_db, spr_pc1_running_shotgun],
	[spr_pc1_running_uzi, spr_pc1_running_mg, spr_pc1_running_dbmg, spr_pc1_running_supershotgun],
	[spr_pc1_running_db, spr_pc1_running_dbmg, spr_pc1_running_db, spr_pc1_running_supershotgun],
	[spr_pc1_running_shotgun, spr_pc1_running_supershotgun, spr_pc1_running_supershotgun, spr_pc1_running_supershotgun]
	];
	
	return animDataRun[weaponChoice1][weaponChoice2];
}


function standAnim(characterChoice = 1, weaponChoice1 = 0, weaponChoice2 = 0){
	var animDataStand = [
	[spr_pc1_standing_pistol, spr_pc1_standing_uzi, spr_pc1_standing_db, spr_pc1_standing_shotgun],
	[spr_pc1_standing_uzi, spr_pc1_standing_mg, spr_pc1_standing_dbmg, spr_pc1_standing_supershotgun],
	[spr_pc1_standing_db, spr_pc1_standing_dbmg, spr_pc1_standing_db, spr_pc1_standing_supershotgun],
	[spr_pc1_standing_shotgun, spr_pc1_standing_supershotgun, spr_pc1_standing_supershotgun, spr_pc1_standing_supershotgun]
	];
	
	return animDataStand[weaponChoice1][weaponChoice2];	
}

function jumpAnimationChoice(characterChoice = 1){
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