/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_pc1)){
	if(point_distance(x, y, obj_pc1.x, obj_pc1.y) < sprite_width/2){
		image_index = 1;
		pickupTimer = ((keyboard_check_pressed(ord("X"))*(room_speed/2)) + (pickupTimer - keyboard_check(ord("X")))) * (1 - keyboard_check_released(ord("X")));
		if(pickupTimer < 0){
			obj_pc1.weapon = weaponList[weaponSelect];
			instance_destroy(self);
		};
	}else{
		image_index = 0;
	};
};

