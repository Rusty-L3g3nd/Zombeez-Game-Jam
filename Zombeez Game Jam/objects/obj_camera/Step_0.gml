/// @description Insert description here
// You can write your code in this editor



if(instance_exists(obj_pc1)){
	x = lerp(x, obj_pc1.x + ((view_wport/2.5)*sign(obj_pc1.image_xscale)), 0.15);
};