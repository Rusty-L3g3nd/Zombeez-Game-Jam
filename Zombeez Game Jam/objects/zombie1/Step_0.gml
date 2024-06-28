// Standing and running animation
	if(!countDown)
		xspd=moveDir*moveSpd
	
	if(moveDir != 0){
		sprite_index = sprite_walking;
		image_xscale = moveDir*-1;
	}else{
		sprite_index = sprite_standing;
	};

//horizontal movement

//collision
	var _subPixel=0.5; 
	if place_meeting(x+xspd,y,obj_wall){
		var _pixelCheck=_subPixel*sign(xspd);
		while(!place_meeting(x+_pixelCheck,y,obj_wall)){
 			x+=_pixelCheck;
		};
		xspd=0;
		moveDir*=-1;
	};
	var _subPixel=1;
	if(!place_meeting(x+xspd*2,y+0.5,obj_wall)){
		var _pixelCheck=_subPixel*sign(xspd);
		while(place_meeting(x+_pixelCheck,y+0.5,obj_wall)){
 			x+=_pixelCheck;
		};
		xspd=0;
		moveDir*=-1;
	}
	x+=xspd;
	
//y movement
//Gravity
yspd+=grv;

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


if(point_distance(x,y,obj_pc1.x,obj_pc1.y)<200 and !detectedOnce){
		sprite_index=sprite_standing;
		if(countDown<=0)
			xspd=0;
			countDown=60;
			detectedOnce=true;
		countDown--;
}
else{
	xspd=moveDir*moveSpd;
	detectedOnce=false;
}



// Shooting code
/*
if(onGround){
	alarm[0] = bulletSpawner(x, y, image_xscale, alarm[0]);
};
*/

