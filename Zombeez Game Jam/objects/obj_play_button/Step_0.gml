// Step Event of obj_play_button

// Check for mouse over
if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width * scale / 2, y - sprite_height * scale / 2, x + sprite_width * scale / 2, y + sprite_height * scale / 2)) {
    alpha = 1;
    if (mouse_check_button_pressed(mb_left)) {
        room_goto_next(); // Move to the next room on click
    }
} else {
    // Update transparency for fade effect
    if (fade_in) {
        alpha += fade_speed;
        if (alpha >= fade_max) {
            alpha = fade_max;
            fade_in = false; // Start fading out
        }
    } else {
        alpha -= fade_speed;
        if (alpha <= fade_min) {
            alpha = fade_min;
            fade_in = true; // Start fading in
        }
    }
}
