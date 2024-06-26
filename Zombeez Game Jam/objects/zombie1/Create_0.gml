/// @description Insert description here
// You can write your code in this editor


/// @description Insert description here
// You can write your code in this editor

moveDir=-1;
moveSpd=2;
xspd=moveSpd*moveDir;
yspd=0;
grv=0.5

//detection and attack range
detectRadius=10;
attackRadius=2;


onGround=true;


// Animation variables
sprite_index = spr_pc1_standing_11;
sprite_standing=spr_zombie1_standing;
sprite_walking = spr_zombie1_walking1;
//sprite_walking2 = spr_zombie1_walking2;
sprite_dying2= spr_zombie1_dying1;
sprite_dying2= spr_zombie1_dying2;

image_xscale = 1;
image_speed = 0.4;

// Shooting variables
/*randomize();
weapon = "Pistol"; // We have got Pistol, Uzi, DB, Shotgun, MG, DBMG, MGSG, Quad Barrel, DBSG, Super Shotgun
bulletInit();
*/