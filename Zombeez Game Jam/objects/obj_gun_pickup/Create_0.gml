/// @description Insert description here
// You can write your code in this editor


spriteList = [spr_uzi, spr_double_barrel, spr_shotgun];
randomize();
weaponSelect = irandom(2);
sprite_index = spriteList[weaponSelect];
weaponList = ["Uzi", "DB", "Shotgun"];
image_speed = 0;

pickupTimerX = 0;
pickupTimerC = 0;