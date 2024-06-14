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
//x += 4;