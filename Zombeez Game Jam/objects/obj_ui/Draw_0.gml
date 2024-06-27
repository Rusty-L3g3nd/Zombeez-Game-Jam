/// @description Insert description here
// You can write your code in this editor


draw_sprite(spr_weapon_slot, 0, 24, 16);
draw_sprite(spr_weapon_slot, 0, 66, 16);

if(instance_exists(obj_pc1)){
	if(obj_pc1.slot1){
		draw_sprite(weaponList[obj_pc1.slot1-1],0, 24, 16);
	};
	
	if(obj_pc1.slot2){
		draw_sprite(weaponList[obj_pc1.slot2-1],0, 66, 16);
	};
};