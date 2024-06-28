/// @description Insert description here
// You can write your code in this editor


draw_sprite_ext(spr_weapon_slot, 0, 48, 32, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_weapon_slot, 0, 132, 32, 2, 2, 0, c_white, 1);

if(instance_exists(obj_pc1)){
	if(obj_pc1.slot1){
		draw_sprite_ext(weaponList[obj_pc1.slot1-1],0, 48, 32, 2, 2, 0, c_white, 1);
	};
	
	if(obj_pc1.slot2){
		draw_sprite_ext(weaponList[obj_pc1.slot2-1],0, 132, 32, 2, 2, 0, c_white, 1);
	};
};