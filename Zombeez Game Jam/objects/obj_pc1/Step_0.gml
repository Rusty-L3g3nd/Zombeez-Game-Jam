 /// @description Insert description here
// You can write your code in this editor
//get inputs
	getControls()


//setting directions
	moveDir=key_right-key_left;
	if(!key_dash){
		xspd=moveDir* moveSpd;
	}	
	else if(key_dash){
		xspd=moveDir* dshSpd;
	}
// Standing and running animation
	if(moveDir != 0){
		sprite_index = sprite_running;
		image_xscale = moveDir;
	}else{
		sprite_index = sprite_standing;
	};
	//movementAnimationChoice(characterChoice);
	
	
//horizontal movement

//collision
	var _subPixel=0.5; 
	if place_meeting(x+xspd,y,obj_wall){
		var _pixelCheck=_subPixel*sign(xspd);
		while(!place_meeting(x+_pixelCheck,y,obj_wall)){
 			x+=_pixelCheck;
		};
		xspd=0;
	};
	x+=xspd;
	
// Recoil knockback
if(recoil){
	if(!place_meeting(x-(recoil*image_xscale), y, obj_wall)){
		x -= recoil*image_xscale;
		recoil -= 1;
	};
};

//y movement
//Gravity
	yspd+=grv;

//JUMP
	//reset jumpMax
	if(onGround){
		jumpCount=0;
		jumpHoldTimer=0;
	}
	else{
		if(jumpCount==0){
			jumpCount=1;
		}
	}
//Initiate Jump	
	if (jumpKeyBuffered && jumpCount<jumpMax){
		jumpKeyBuffered=false;
		jumpKeyBufferTimer=0;
		
		jumpHoldTimer=jumpHoldFrames;
		

		jumpCount++;
	}
	
	if(!key_jump){
		jumpHoldTimer=0;
	}
	//set Jump speed
	if(jumpHoldTimer>0){
		yspd=jspd;
		jumpHoldTimer--;
	};


// Landing juice
if(yspd){
	if(place_meeting(x, y+yspd, obj_wall)){
		image_yscale = 0.8;
		image_xscale = sign(image_xscale)*1.2;
	};
};

//y collision
	var _subPixel=0.5; 
	if place_meeting(x,y+yspd,obj_wall){
		var _pixelCheck=_subPixel*sign(yspd);
		while(!place_meeting(x,y+_pixelCheck,obj_wall)){
			y+=_pixelCheck;
		};
		yspd=0;
	};
	
	
	y+=yspd;

//Check if player is on ground
	if(yspd>=0 && place_meeting(x,y+1,obj_wall)){
		onGround=true; 
	}
	else{
		onGround=false;
		
		// Jump animation
		sprite_index = sprite_jumping;
		image_index = 1;
		//jumpAnimationChoice(characterChoice);
	};
//cap velocity
	if (yspd > termVel){
		yspd=termVel;
	};


// Shooting code
if(onGround){
	alarm[0] = bulletSpawner(x, y, image_xscale, alarm[0]);
	if(image_yscale != 1){
		y += ceil((sprite_height*image_yscale)-(sprite_height*(image_yscale+0.1)))/2;
		image_yscale += 0.1;
	};
	if(image_xscale != (1*sign(image_xscale))){
		//x += (ceil((sprite_width*image_xscale)-(sprite_width*(image_xscale+0.1)))/2)*sign(image_xscale);
		image_xscale = lerp(image_xscale, 1*sign(image_xscale), 0.1);
	};
};