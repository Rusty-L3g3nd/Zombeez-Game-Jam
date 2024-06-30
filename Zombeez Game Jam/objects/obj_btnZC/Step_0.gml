/// @description Insert description here
// You can write your code in this editor


img_scale = lerp(img_scale, 1.5 + scale, 0.5);

if((img_scale == 1.5+scale) and (wait == false)){
	alarm[0] = time;
	wait = true;
};