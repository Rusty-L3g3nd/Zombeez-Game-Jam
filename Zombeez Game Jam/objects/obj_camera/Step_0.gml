/// @description Insert description here
// You can write your code in this editor



if(instance_exists(obj_pc1)){
	xNew = lerp(x, obj_pc1.x + ((screen_width/4)*sign(obj_pc1.image_xscale)), 0.1);
	spd = x - xNew;
	x = xNew;
	if(recoil){
		x -= recoil*obj_pc1.image_xscale;
		recoil -= 1;
	};
	
	y = lerp(y, obj_pc1.y, 0.1);
	if(yrecoil){
		y -= yrecoil;
		yrecoil -= 1;
	};
};

//layer_hspeed("Assets_1", -1*sign(obj_pc1.xspd)/8);
//layer_hspeed("Background", -1*sign(obj_pc1.xspd)/16);

layer_hspeed("Assets_1", spd/8);
layer_hspeed("Background", spd/16);