/// @description Insert description here
// You can write your code in this editor
controlSetup();
characterChoice=1;
//basic movement
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
sprite_index = spr_pc1_standing_11;
image_xscale = 1;
image_speed = 0.4;

// Shooting variables
randomize();
weapon = "Pistol";
alarm[0] = 0;