if (showing_dialog == true) {
    var text_x = 30;
	var height = 32;
    var text_y = display_get_gui_height() - height - height_text_y - additional_height;
    var border = 5;
    var padding = 16;

    height = string_height(current_dialog.message);

    if (sprite_get_height(current_dialog.sprite) > height) {
        height = sprite_get_height(current_dialog.sprite) + additional_height;
    }

    height += padding * 2;
    text_x = sprite_get_width(current_dialog.sprite) + (padding * 2);

    draw_set_alpha(alpha);

    draw_set_colour(c_black); // screen size black
    draw_rectangle(0, display_get_gui_height() - height, display_get_gui_width(), display_get_gui_height(), false);

    draw_set_colour(c_white); // text box border
    draw_rectangle(border, display_get_gui_height() - height + border, display_get_gui_width() - border, display_get_gui_height() - border, false);

    draw_set_colour(c_grey); // text box inside
    draw_rectangle(border * 2, display_get_gui_height() - height + border * 2, display_get_gui_width() - border * 2, display_get_gui_height() - border * 2, false);

    if (current_dialog.sprite != -1) {
        draw_sprite(current_dialog.sprite, 0, border * 3, display_get_gui_height() - height + border * 3);
    }

    draw_set_font(fnt_msgothic);
    draw_set_colour(c_black); // text colour
    draw_text_ext(text_x, text_y, current_dialog.message, 25, display_get_gui_width() - 192);

    alpha = lerp(alpha, 1, 0.06);
}

draw_set_alpha(1);

