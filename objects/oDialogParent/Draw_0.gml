/// @description Insert description here
// You can write your code in this editor

if (global.dialogueState != DialogueState.None)
{
    draw_set_font(fnt_ComicSans);

    var display_text = "Press Space to skip";

    // Calculate the position to draw the text at a fixed position on the camera view
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);

    var text_x = cam_x + cam_w - string_width(display_text) - 20; // Adjusted to the top right corner
    var text_y = cam_y + 12; // You can adjust the vertical position as needed

    var rect_width = string_width(display_text) + 16; // Add padding on both sides
    var rect_height = string_height(display_text) + 8; // Add padding on both top and bottom

    // Set the background color with low opacity (e.g., c_white with an alpha value)
    draw_set_alpha(0.5);

    // Draw the background rectangle
    draw_set_color(c_white);
    draw_rectangle(text_x - 8, text_y - 4, text_x + rect_width, text_y + rect_height, false);

    // Reset alpha to 1 for normal drawing
    draw_set_alpha(1);

    draw_set_color(c_black);
    draw_text(text_x, text_y, display_text); // Draw the text on the calculated position
}