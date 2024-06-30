/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_pc1)){
	if(point_distance(x, y, obj_pc1.x, obj_pc1.y) < sprite_width/2){
		image_index = 1;
		obj_btnZC.alpha = 1;
		pickupTimerX = ((keyboard_check_pressed(ord("X"))*(room_speed/2)) + (pickupTimerX - keyboard_check(ord("X")))) * (1 - keyboard_check_released(ord("X")));
		if(pickupTimerX < 0){
			obj_pc1.slot2 = weaponSelect+1;
			with(obj_pc1){
				weapon = weaponList[slot1][slot2];
				sprite_standing = standAnim(, slot1, slot2);
				sprite_running = runAnim(, slot1, slot2);
			};
			obj_btnZC.alpha = 0;
			instance_destroy(self);
		};
		pickupTimerC = ((keyboard_check_pressed(ord("Z"))*(room_speed/2)) + (pickupTimerC - keyboard_check(ord("Z")))) * (1 - keyboard_check_released(ord("Z")));
		if(pickupTimerC < 0){
			obj_pc1.slot1 = weaponSelect+1;
			with(obj_pc1){
				weapon = weaponList[slot1][slot2];
				sprite_standing = standAnim(, slot1, slot2);
				sprite_running = runAnim(, slot1, slot2);
			};
			instance_destroy(self);
			obj_btnZC.alpha = 0;
		};
	}else{
		image_index = 0;
		obj_btnZC.alpha = 0;
	};
};

if(!place_meeting(x, y+2, obj_wall)){
	y += 2;
};

