// Step Event of obj_trash_can

// Apply gravity
vy += gravity;

// Update position
x += vx;
y += vy;

// Apply friction to velocities
vx *= friction;
vy *= friction;

// Update rotation
image_angle += rotation_speed;
rotation_speed *= angular_friction;

// Check for ground collision and stop if on the ground
if (place_meeting(x, y + 1, obj_wall) && !place_meeting(x, y - bbox_bottom + bbox_top - 1, obj_wall)) {
    // Move the trash can up until it's no longer colliding with the ground
    while (place_meeting(x, y + 1, obj_wall)) {
        y -= 1;
    }

    // Stop vertical motion
    vy = 0;

    // Apply additional friction when on the ground to stop rotation and horizontal movement over time
    vx *= 0.8;
    rotation_speed *= 0.8;

    // Stop horizontal motion if very slow
    if (abs(vx) < 0.1) {
        vx = 0;
    }

    // Stop rotation if very slow
    if (abs(rotation_speed) < 0.1) {
        rotation_speed = 0;
    }
}
