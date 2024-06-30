/// @description Insert description here
// You can write your code in this editor

var zList = [zombie1, zombie2, zombie3];

var z = instance_create_layer(x, y, "Instances", zList[irandom(2)]);
z.image_xscale = z.image_xscale * sign(image_xscale);

instance_destroy(self);