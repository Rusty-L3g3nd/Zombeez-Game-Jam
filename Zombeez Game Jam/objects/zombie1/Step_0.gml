if(hp<=0){
	if(countDown==60){
		sprite_index=sprite_dying;
		image_speed = 1.5;
		state = states.dying;
	};
	
	//if(ev_animation_end){
	//	image_speed = 0;
	//};
	
	if(countDown==0){
		//instance_destroy(self);
	};
	
	countDown--;
}else{
	
	if(recoil != 0){
		x += recoil;
		recoil -= sign(recoil);
	};
	
	xspd=moveDir*moveSpd
	
		if(moveDir != 0){
			sprite_index = sprite_walking;
			image_xscale = moveDir*-1;
		}else if(moveDir ==0 and state==states.idle){
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
		var _subPixel=0.1;
		if(!place_meeting(x+xspd,y+0.5,obj_wall)){
			state=states.idle;
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
			if((obj_pc1.y-y)*(obj_pc1.y-y) < 65  ){
				state=states.follow;
			}
		}
	}

	if(state == states.follow){
		if(!place_empty(x+xspd,y,obj_wall)){
			state=states.idle;
		}
		else
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
			state=states.idle;
		}
	}

}

x = clamp(x, 500, 4300);