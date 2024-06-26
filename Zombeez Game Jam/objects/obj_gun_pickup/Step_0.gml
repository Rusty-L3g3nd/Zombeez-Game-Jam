/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_pc1)){
	if(point_distance(x, y, obj_pc1.x, obj_pc1.y) < sprite_width/2){
		image_index = 1;
		pickupTimerX = ((keyboard_check_pressed(ord("X"))*(room_speed/2)) + (pickupTimerX - keyboard_check(ord("X")))) * (1 - keyboard_check_released(ord("X")));
		if(pickupTimerX < 0){
			obj_pc1.slot1 = weaponSelect+1;
			with(obj_pc1){
				weapon = weaponList[slot1][slot2];
			};
			instance_destroy(self);
		};
		pickupTimerC = ((keyboard_check_pressed(ord("C"))*(room_speed/2)) + (pickupTimerC - keyboard_check(ord("C")))) * (1 - keyboard_check_released(ord("C")));
		if(pickupTimerC < 0){
			obj_pc1.slot2 = weaponSelect+1;
			with(obj_pc1){
				weapon = weaponList[slot1][slot2];
			};
			instance_destroy(self);
		};
	}else{
		image_index = 0;
	};
};

