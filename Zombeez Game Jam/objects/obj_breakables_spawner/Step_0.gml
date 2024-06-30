/// @description Insert description here
// You can write your code in this editor


if(spawn = true){
	xpt = obj_pc1.x + irandom_range(-512, 512);
	xpt = clamp(xpt, 500, 4300);
	instance_create_layer(xpt, 490, "Instances", toSpawn);
	alarm[0] = random_range(room_speed*5, room_speed*20);
	spawn = false;
};