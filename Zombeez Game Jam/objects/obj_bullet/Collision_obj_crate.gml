/// @description Insert description here
// You can write your code in this editor


if(other.hp>0){
	other.hp -= 1;
	instance_create_layer(x, y, "Instances", obj_collision_particles);
	instance_destroy(self);
};

if(other.hp < 1){
	with(other){
		var limit = irandom_range(1, 3);
			for(i=0;i<limit;i+=1){
				var explosion = instance_create_layer(x+random_range(-sprite_width/2, sprite_width/2), y+random_range(-sprite_height/2, sprite_height/2), "Instances1", obj_explosion);
				var explosion_size = random_range(0.3, 1.5);
				explosion.image_xscale = explosion_size;
				explosion.image_yscale = explosion_size;
				explosion.image_speed = 0.8;
			};
		instance_destroy(self);
	};
}




