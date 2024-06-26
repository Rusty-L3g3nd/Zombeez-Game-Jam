/// @description Insert description here
// You can write your code in this editor

bubble(x, y, 1, 0.01, 0.01, 0.1, 0.01, 0.01, c_yellow);
// Spawn bullets
for(i=0;i<3;i++){
					var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
					bullet.direction = 90 - (90 * sign(image_xscale)) + (- 15 + (15*i));
					bullet.image_angle = bullet.direction;
					bullet.speed = 15;
					with(bullet){
						image_xscale = 2;
						image_yscale = 1;
					};
				};
				
				
instance_destroy(self)