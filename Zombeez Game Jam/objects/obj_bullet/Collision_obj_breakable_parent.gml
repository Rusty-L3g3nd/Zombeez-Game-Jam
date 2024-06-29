/// @description Insert description here
// You can write your code in this editor




with(other){
	randomize();
	if(hp>-1){
		hp -= 1;
		if(hp < 0){
			col = c_grey;
			var limit = irandom_range(3, 7);
			for(i=0;i<limit;i+=1){
				var explosion = instance_create_layer(x+random_range(minOffsetX, maxOffsetX), y+random_range(minOffsetY, maxOffsetY), "Instances1", obj_explosion);
				var explosion_size = random_range(0.3, 1.5);
				explosion.image_xscale = explosion_size;
				explosion.image_yscale = explosion_size;
				explosion.image_speed = 0.8;
			};
			image_index = 1;
		};
	};
};

instance_create_layer(x, y, "Instances", obj_collision_particles);
instance_destroy(self);