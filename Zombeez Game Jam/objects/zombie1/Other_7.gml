/// @description Insert description here
// You can write your code in this editor

//todo add zombie counter and implement sounds only for 2 at a time

/*
if(state == states.follow){
	audio_play_sound(zombie_movement_r,0,false);
}
if(state == states.attack){
	audio_play_sound(zombie_chew,0,false);
}
*/

if(state == states.dying){
	image_speed = 0;
	image_index = image_number-1;
};

alarm[0] = room_speed * 10;



