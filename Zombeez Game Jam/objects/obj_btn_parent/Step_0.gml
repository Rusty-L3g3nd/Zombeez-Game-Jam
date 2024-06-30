/// @description Insert description here
// You can write your code in this editor




img_scale = lerp(img_scale, 1.5 + scale, 0.5);
image_xscale = img_scale;
image_yscale = img_scale;

if((img_scale == (1.5 + scale)) and (wait == false)){
	alarm[0] = time;
	wait = true;
};