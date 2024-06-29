/// @description Insert description here
// You can write your code in this editor


if(instance_exists(obj_pc1)){
	with(obj_camera){
		recoil = 0;
		yrecoil = 0;
		x = obj_pc1.x + ((screen_width/4)*sign(obj_pc1.image_xscale));
		y = obj_pc1.y;
	};	
};
instance_destroy(self);