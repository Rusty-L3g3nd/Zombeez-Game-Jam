/// @description Insert description here
// You can write your code in this editor

var randomizer= irandom_range(1,2);
if(randomizer==1)
	audio_play_sound(zombie_roar_1,0,false);
else
	audio_play_sound(zombie_roar_2,0,false);

if(instance_exists(obj_pc1)){
	image_xscale = sign(x - obj_pc1.x);
};
