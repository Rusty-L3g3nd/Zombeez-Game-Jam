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


function bulletInit(){
	bulletsShot = 0;
	alarm[0] = 0;
	bulletTimer = alarm[0];
}


function bubble(xloc, yloc, alpha_start = 1, xscale_start, yscale_start, alpha_step, xscale_step, yscale_step, colour){
	var bubble = instance_create_layer(xloc, yloc, "Instances", obj_vfx_bubble);
	with(bubble){
		image_alpha = alpha_start;
		image_xscale = xscale_start;
		image_yscale = yscale_start;
		alpha_dec = alpha_step;
		xscale_inc = xscale_step;
		yscale_inc = yscale_step;
		image_blend = colour;
	};
}


function muzzleFlash(xloc, yloc, xscale, spriteName){
	// Draw muzzle flash
	var flash = instance_create_layer(xloc, yloc, "Instances", obj_muzzleflash);
	flash.sprite_index = spriteName;
	flash.image_xscale = xscale;
}


function knockBack(Xamt = 3, Yamt = 0){
	obj_pc1.recoil = Xamt;
	obj_pc1.y -= Yamt;
};


function cameraRecoil(amt = 4){
	obj_camera.recoil = amt;
}


function bulletSpawner(playerX, playerY, playerXscale, timer){
	bulletTimer = timer;
	switch(weapon){
		case "Pistol": // Case 1 of 10
			if(shootPressed and bulletTimer<0){
				// Muzzle flash
				muzzleFlash(playerX, playerY, playerXscale, spr_pistol_muzzleflash);
				bubble(playerX+(playerXscale*31), playerY-(random_range(5, 6)), 1, 0.002, 0.01, 0.1, 0.002, 0.01, c_yellow);
				
				// Spawn bullet
				var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-(random_range(5, 6)), "Instances", obj_bullet);
				with(bullet){
					direction = (random_range(88, 92) - (90*playerXscale));
					speed = 15; //playerXscale*15; multiplying with playerXscale will set velocity direction, conflicting with the above direction code
					image_xscale = playerXscale*2;
				};
				
				// Set timer to control rate of fire
				bulletTimer = room_speed/5;
			};
		break;
		
		case "Uzi": // Case 2 of 10
			if(shootHeld or !(bulletsShot == 0)){
			if(bulletTimer<0){
				// Muzzle flash
				muzzleFlash(playerX, playerY, playerXscale, spr_uzi_muzzleflash);
				bubble(playerX+(playerXscale*30), playerY-(random_range(4, 5)), 1, 0.002, 0.01, 0.1, 0.002, 0.01, c_yellow);
				
				// Spawn bullet
				bulletsShot = bulletsShot + 1;
				var bullet = instance_create_layer(playerX+(playerXscale*30), playerY-(random_range(4, 5)), "Instances", obj_bullet);
				with(bullet){
					direction = (random_range(89, 91) - (90*playerXscale));
					speed = 15;
					image_xscale = playerXscale*2;
				};
				
				if(bulletsShot>2){ // Pause every three shots
					bulletTimer = room_speed/2;//alarm[0] = room_speed/2;
					bulletsShot = 0;
				}else{ // Pause between shots
					bulletTimer = room_speed/7;
				};
			};
			};
		break;
		
		case "DB": // Case 3 of 10
			if(shootPressed and bulletTimer<0){
				// Spawn bullet
				dir = (random_range(88, 92) - (90*playerXscale));
				for(i=0;i<2;i+=1){
					var bullet = instance_create_layer(playerX+(playerXscale*18+(i*6)), playerY-(5+(4*i)), "Instances", obj_bullet);
					bullet.direction = dir;
					bullet.image_angle = dir;
					with(bullet){
						speed = 15; //playerXscale*15; multiplying with playerXscale will set velocity direction, conflicting with the above direction code
						image_xscale = 2;//playerXscale*2;
					};
				};
				
				// Set timer to control rate of fire
				bulletTimer = room_speed/5;
			};
		break;
		
		case "Shotgun": // Case 4 of 10
			if(shootPressed and bulletTimer<0){
				// Spawn bullet
				for(i=0;i<3;i++){
					var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-5, "Instances", obj_bullet);
					bullet.direction = -5 + (5*i);
					bullet.image_angle = bullet.direction;
					with(bullet){
						speed = 15*playerXscale;
						image_xscale = 2*playerXscale;
					};
				};
				
				// Knockback
				knockBack();
				cameraRecoil();
				
				// Set timer to control rate of fire
				bulletTimer = room_speed/5;
			};
		break;
		
		case "MG": // Case 5 of 10
			if(shootHeld){
				if(bulletTimer<0){
					var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-(random_range(4, 7)), "Instances", obj_bullet);
					with(bullet){
						direction = (random_range(85, 95) - (90*playerXscale));
						speed = 15;
						image_xscale = playerXscale*2;
					};
				bulletTimer = room_speed/10;
				};
			};
		break;
		
		case "DBMG": // Case 6 of 10
			if(shootHeld){
				if(bulletTimer<0){
					bulletsShot += 1;
					dir = (random_range(85, 95) - (90*playerXscale));
					
					for(i=0;i<2;i+=1){
						var bullet = instance_create_layer(playerX+(playerXscale*18+(i*6)), playerY-(5+(4*i)), "Instances", obj_bullet);
						bullet.direction = dir;
						bullet.image_angle = dir;
						bullet.image_xscale = 2;
						bullet.speed = 15;
					};
	
				
					//bulletTimer = room_speed/10;
					if(bulletsShot>2){ // Pause every three shots
						bulletTimer = room_speed/2;//alarm[0] = room_speed/2;
						bulletsShot = 0;
					}else{ // Pause between shots
						bulletTimer = room_speed/10;
					};
				};
			};
		break;
		
		case "MGSG": // Case 7 of 10
			if(shootHeld or !(bulletsShot == 0)){
			if(bulletTimer<0){
				bulletsShot = bulletsShot + 1;
				
				for(i=0;i<3;i++){
					var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-5, "Instances", obj_bullet);
					bullet.direction = -5 + (5*i);
					bullet.image_angle = bullet.direction;
					with(bullet){
						speed = 15*playerXscale;
						image_xscale = playerXscale*2;
					};
				};
				
				// Knockback
				knockBack();
				cameraRecoil();
				
				if(bulletsShot>2){ // Pause every three shots
					bulletTimer = room_speed/2;//alarm[0] = room_speed/2;
					bulletsShot = 0;
				}else{ // Pause between shots
					bulletTimer = room_speed/7;
				};
			};
			};
		break;
		
		case "Quad Barrel": // Case 8 of 10
			if(shootPressed and bulletTimer<0){
				// Spawn bullet
				dir = (random_range(88, 92) - (90*playerXscale));
				for(i=0;i<4;i+=1){
					var bullet = instance_create_layer(playerX+(playerXscale*18+(i*6)), playerY-(5+(2*i)), "Instances", obj_bullet);
					bullet.direction = dir;
					bullet.image_angle = dir;
					with(bullet){
						speed = 15;
						image_xscale = image_xscale*2;
					};
				};
				
				// Set timer to control rate of fire
				bulletTimer = room_speed/5;
			};
		break;
		
		case "DBSG": // Case 9 of 10
			if(shootPressed and bulletTimer<0){
				// Spawn bullet
				for(i=0;i<7;i++){
					var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-5, "Instances", obj_bullet);
					bullet.direction = -15 + (5*i);
					bullet.image_angle = bullet.direction;
					with(bullet){
						speed = 15*playerXscale;
						image_xscale = playerXscale*2;
					};
				};
				
				// Knockback
				knockBack(5, 1);
				cameraRecoil(5);
				
				// Set timer to control rate of fire
				bulletTimer = room_speed/5;
			};
		break;
		
		case "Super Shotgun": // Case 10 of 10
			if(shootPressed and bulletTimer<0){
				// Spawn bullet
				for(i=0;i<3;i++){
					var bullet = instance_create_layer(playerX+(playerXscale*18), playerY-5, "Instances", obj_bullet);
					bullet.direction = -5 + (5*i);
					bullet.image_angle = bullet.direction;
					with(bullet){
						speed = 15*playerXscale;
						image_xscale = 3*playerXscale;
						image_yscale = 1.5;
						alarm[0] = room_speed/4;
					};
				};
				
				// Knockback
				knockBack(7, 2);
				cameraRecoil(7);
				
				// Set timer to control rate of fire
				bulletTimer = room_speed/5;
			};
		break;
	};
	return bulletTimer;
}