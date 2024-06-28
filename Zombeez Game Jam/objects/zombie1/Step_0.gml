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
	moveDir=0;
	if(distance_to_object(obj_pc1) < detectRadius){
		state=states.follow;
	}
	
}
if(state == states.follow){
	moveDir=sign(obj_pc1.x-x);
	if(distance_to_object(obj_pc1) > detectRadius){
		state=states.idle;
	}
	else if(distance_to_object(obj_pc1) < attackRadius){
		state=states.attack;
	}
}

if(state==states.attack){
	moveDir=0;
	sprite_index=sprite_atk;
	if(distance_to_object(obj_pc1) > attackRadius){
		
		//x+=200;
		state=states.idle;
	}
}
