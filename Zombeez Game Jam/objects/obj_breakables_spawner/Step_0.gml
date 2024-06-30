/// @description Insert description here
// You can write your code in this editor


if(spawn = true){
	do{
	xpt = obj_pc1.x + irandom_range(-view_wport[0], view_wport[0]);
	xpt = clamp(xpt, 500, 4300);
	}until(point_distance(obj_pc1.x, obj_pc1.y, xpt, 490) < view_wport[0]);
	instance_create_layer(xpt, -16, "Instances", toSpawn);
	alarm[0] = random_range(room_speed*5, room_speed*20);
	spawn = false;
};