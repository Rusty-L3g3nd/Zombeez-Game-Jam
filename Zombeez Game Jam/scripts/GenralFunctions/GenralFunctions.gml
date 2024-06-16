// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function controlSetup(){
	bufferTime=5;
	
	jumpKeyBuffered=0;
	jumpKeyBufferTimer=0;
	
	/*CoolDownTimer=5;
	dashKeyCoolDownTimer=0;*/
}

function getControls(){
	//horizontal movement
	key_left=keyboard_check(vk_left);
	key_right=keyboard_check(vk_right);
	
	//jumps
	key_jump_pressed=keyboard_check_pressed(vk_space);
	key_jump=keyboard_check(vk_space);
	
	//dash
	key_dash=keyboard_check_pressed(vk_shift);
	
	//jump key buffering
	if key_jump_pressed{
		jumpKeyBufferTimer=bufferTime;
	}
	
	if jumpKeyBufferTimer>0{
		jumpKeyBuffered=1;
		jumpKeyBufferTimer--;
	}else{
		jumpKeyBuffered=0;
	}
	
	//dash key buffering
	/*if key_dash{
		dashKeyCoolDownTimer=CoolDownTimer;
	}
	if(dashKeyCoolDownTimer>0){
		key_dash=0;	
		dashKeyCoolDownTimer--;
	}*/
	//crouch
	key_down=keyboard_check(vk_down);
	
	// Shoot
	shoot = keyboard_check_pressed(ord("Z"));
}