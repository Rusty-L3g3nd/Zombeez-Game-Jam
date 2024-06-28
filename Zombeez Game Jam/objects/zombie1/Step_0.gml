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
		while(!place_meeting(x-_pixelCheck,y,obj_wall)){
 			x+=_pixelCheck;
		};
		xspd=0;
		moveDir*=-1;
	};
	var _subPixel=2;
	if(!place_meeting(x+xspd,y+0.5,obj_wall)){
		var _pixelCheck=_subPixel*sign(xspd);
		while(place_meeting(x+_pixelCheck,y+0.5,obj_wall)){
 			x+=_pixelCheck;
		};
		xspd=0;
		sprite_index=sprite_standing;
	}
	x+=xspd;
	
//y movement
//Gravity

yspd+=1;

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



if state== states.idle{
	
	if((obj_pc1.x-x)*sign(obj_pc1.x-x) < detectRadius and (obj_pc1.y-y)*sign(obj_pc1.y-y) < 50){
		state=states.follow;
	}
	
}
if(state == states.follow){
	moveDir=sign(obj_pc1.x-x);
	if((obj_pc1.x-x)*sign(obj_pc1.x-x) > detectRadius){
		state=states.idle;
		countDown=60
	}
	else if((obj_pc1.x-x)*sign(obj_pc1.x-x) < attackRadius){
		state=states.attack;
	}
}

if(state==states.attack){
	moveDir=0;
	sprite_index=sprite_atk;
	if((obj_pc1.x-x)*sign(obj_pc1.x-x) > attackRadius){
		state=states.idle;
	}
}
