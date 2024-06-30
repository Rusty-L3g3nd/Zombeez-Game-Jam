/// @description Insert description here
// You can write your code in this editor





if(!place_meeting(x, y+yspd, obj_wall)){
	y += yspd;
}else{
	while(!place_meeting(x, y+1, obj_wall)){
		y += 1;
	};
};