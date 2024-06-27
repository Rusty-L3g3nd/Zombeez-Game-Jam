// Collision Event with obj_bullet
var _force = 5;
var _direction;

// Calculate the relative hit position based on the current rotation
var relative_hit_x = dcos(-image_angle) * (other.x - x) - dsin(-image_angle) * (other.y - y);
var relative_hit_y = dsin(-image_angle) * (other.x - x) + dcos(-image_angle) * (other.y - y);

// Determine the quadrant of the hit relative to the object's rotation
if (relative_hit_x < 0 && relative_hit_y < 0) {
    // Top left quadrant
    _direction = 45; // Right and down
    rotation_speed += random_range(1, 3); // Rotate clockwise
} else if (relative_hit_x < 0 && relative_hit_y > 0) {
    // Bottom left quadrant
    _direction = 315; // Right and up
    rotation_speed += random_range(-3, -1); // Rotate counterclockwise
} else if (relative_hit_x > 0 && relative_hit_y < 0) {
    // Top right quadrant
    _direction = 135; // Left and down
    rotation_speed += random_range(-3, -1); // Rotate counterclockwise
} else if (relative_hit_x > 0 && relative_hit_y > 0) {
    // Bottom right quadrant
    _direction = 225; // Left and up
    rotation_speed += random_range(1, 3); // Rotate clockwise
}

// Apply the force in the calculated direction
vx += lengthdir_x(_force, _direction);
vy += lengthdir_y(_force, _direction);
