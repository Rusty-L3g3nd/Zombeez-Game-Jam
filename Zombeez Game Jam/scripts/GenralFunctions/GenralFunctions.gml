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
	shootPressed = keyboard_check_pressed(ord("Z"));
	shootHeld = keyboard_check(ord("Z"));
}

function bulletSpawner(playerX, playerY, playerXscale, timer){
	switch(weapon){
		case "Pistol":
			if(shootPressed and timer<1){
				// Spawn bullet
				var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-(random_range(5, 6)), "Instances", obj_bullet);
				with(bullet){
					/*angle = degtorad(random_range(88, 92) - (90*playerXscale));
					xspd = lengthdir_x(15, angle)*playerXscale;
					yspd = lengthdir_y(15, angle);*/
					direction = (random_range(88, 92) - (90*playerXscale)); // Doesn't seem to be working for some reason
					speed = 15; //playerXscale*15; multiplying with playerXscale will set velocity direction, conflicting with the above direction code
					image_xscale = playerXscale*2;
				};
				
				// Set timer to control rate of fire
				alarm[0] = room_speed/5;
			};
		break;
		
		case "Uzi":
			if(shootHeld){
			
			};
		break;

	};
}