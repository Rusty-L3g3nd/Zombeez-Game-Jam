/// @description Insert description here
// You can write your code in this editor

if(image_alpha <= 0){
	instance_destroy(self);
}


image_alpha -= alpha_dec;
image_xscale += xscale_inc;
image_yscale += yscale_inc;