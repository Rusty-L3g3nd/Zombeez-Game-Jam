/// @description Insert description here
// You can write your code in this editor

//var breakablesList = [spr_car, spr_drum, spr_taxi, spr_vending_machine];

randomize();
hp = irandom_range(3, 7);
image_index = 0;
image_speed = 0;

minOffsetX = (sprite_width/2) * (-1);
maxOffsetX = minOffsetX * (-1);

minOffsetY = (sprite_height/2) * (-1);
maxOffsetY = minOffsetY * (-1);

col = c_white;