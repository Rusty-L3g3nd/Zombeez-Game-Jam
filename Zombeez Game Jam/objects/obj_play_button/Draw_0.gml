// Draw Event of obj_play_button

// Set the transparency
draw_set_alpha(alpha);

// Draw the play button sprite with scaling
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, c_white, alpha);

// Reset transparency to default
draw_set_alpha(1);
