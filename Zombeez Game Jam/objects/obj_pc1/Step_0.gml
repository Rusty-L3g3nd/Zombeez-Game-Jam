/// @description Insert description here
// You can write your code in this editor
//get inputs
	key_left=keyboard_check(vk_left);
	key_right=keyboard_check(vk_right);
	key_jump=keyboard_check_pressed(vk_space);
	key_down=keyboard_check(vk_down);


//setting directions
	moveDir=key_right-key_left;
	xspd=moveDir* moveSpd;
 
 
//collision
	var _subPixel=0.5; 
	if place_meeting(x+xspd,y,obj_wall){
		var _pixelCheck=_subPixel*sign(xspd);
		while(!place_meeting(x+_pixelCheck,y,obj_wall)){
			x+=_pixelCheck
		}
		xspd=0;
	}
	x+=xspd;

//y movement
//Gravity
	yspd+=grv;

//JUMP
	if key_jump && place_meeting(x,y+1,obj_wall){
		yspd=jspd;		
	}

//y collision
	var _subPixel=0.5; 
	if place_meeting(x,y+yspd,obj_wall){
		var _pixelCheck=_subPixel*sign(yspd);
		while(!place_meeting(x,y+_pixelCheck,obj_wall)){
			y+=_pixelCheck
		}
		yspd=0;
	}
	y+=yspd;

//cap velocity
//	if (yspd > terminal){
//		yspd=terminal
//	}
