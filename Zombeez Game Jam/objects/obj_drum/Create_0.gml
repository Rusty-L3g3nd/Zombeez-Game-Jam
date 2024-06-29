/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

image_xscale = 0.8;
image_yscale = 0.8;

minOffsetX = -15;
maxOffsetX = 16;

minOffsetY = -26;
maxOffsetY = 20;

while(!place_meeting(x, y+1, obj_wall)){
	y += 1;
};