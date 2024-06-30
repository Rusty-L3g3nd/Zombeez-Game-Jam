/// @description Insert description here
// You can write your code in this editor
controlSetup();
characterChoice=1;
//basic movement
hp=10;
isDead=false;

moveDir=0;
moveSpd=2;
dshSpd=20;
xspd=0;
yspd=0;

//grav
grv=0.5;
termVel=6;

//jmp vals
jspd = -3.5;
jumpMax=2;
jumpCount=0;

jumpHoldTimer=0;
jumpHoldFrames=18;

onGround=true;

//coyote time
	coyoteHangFrames=2;
	coyoteHangTimers=2;
	coyoteJumpFrames=5;
	coyoteJumpTimer=0;


// Animation variables
sprite_index = spr_pc1_standing_pistol;
sprite_standing=spr_pc1_standing_pistol;
sprite_running = spr_pc1_running_pistol;
sprite_dying= spr_pc1_dying;
sprite_jumping=spr_pc1_jmp;
image_xscale = 1;
image_speed = 0.4;

// Shooting variables
slot1 = 0;
slot2 = 0;
weaponList = [
["Pistol", "Uzi", "DB", "Shotgun"],
["Uzi", "MG", "DBMG", "MGSG"],
["DB", "DBMG", "Quad Barrel", "DBSG"],
["Shotgun", "MGSG", "DBSG", "Super Shotgun"]
];

recoil = 0;

randomize();
weapon = weaponList[slot1][slot2]; // We have got Pistol, Uzi, DB, Shotgun, MG, DBMG, MGSG, Quad Barrel, DBSG, Super Shotgun
bulletInit();