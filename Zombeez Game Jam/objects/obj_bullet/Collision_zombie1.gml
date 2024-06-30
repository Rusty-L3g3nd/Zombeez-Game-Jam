/// @description Insert description here
// You can write your code in this editor

if(other.hp>0){
with(other){
	if(hp>0){
		hitFrom=sign(obj_pc1.x - x);
		hp -= 1;
		flash=3;
		recoil = irandom_range(-hitFrom*3, -hitFrom*7);
	}else{
		state = states.dying;
		image_xscale = abs(image_xscale) * sign(other.image_xscale);
	};
};
};

if(other.hp > 0){
	instance_destroy(self);
};