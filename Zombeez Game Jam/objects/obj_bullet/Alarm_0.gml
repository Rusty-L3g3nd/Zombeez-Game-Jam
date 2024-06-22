/// @description Insert description here
// You can write your code in this editor

// Spawn bullets
for(i=0;i<3;i++){
					var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
					bullet.direction = direction -5 + (5*i);
					bullet.image_angle = bullet.direction;
					bullet.speed = 15;
					with(bullet){
						// speed = 15*image_xscale;
						image_xscale = image_xscale*2;
					};
				};
				
				
instance_destroy(self)