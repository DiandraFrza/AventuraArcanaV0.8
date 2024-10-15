draw_self();

if (active)
{
	draw_set_color(c_grey)
	draw_line(x, y, mx, my);
}

//Health
draw_sprite(sHealthBar_bg, 0, healthbar_x, healthbar_y);
draw_sprite_stretched(sHealthBar,0,healthbar_x, healthbar_y, (hp/hp_max) * healthbar_width, healthbar_height);
draw_sprite(sHealthBorder, 0, healthbar_x, healthbar_y);


//show the number of activated puzzle stone
if (activated_stone != 2 && instance_exists(oBlockage))
{
    draw_set_font(fnt_ComicSans);

    var display_text = "Puzzle Selesai: " + string(activated_stone);

    // Calculate the position to draw the text at a fixed position on the camera view
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);
	
	var text_x = cam_x + cam_w * 0.5 - string_width(display_text) * 0.5;
    var text_y = cam_y + cam_h - 32; // You can adjust the vertical position as needed
	
	var rect_width = string_width(display_text) + 16; // Add padding on both sides
	var rect_height = string_height(display_text) + 8; // Add padding on both top and bottom
	
	// Set the background color with low opacity (e.g., c_white with an alpha value)
	draw_set_alpha(0.5);
	
	// Draw the background rectangle
	//draw_set_color(c_white);
	//draw_rectangle(text_x - 8, text_y - 4, text_x + rect_width, text_y + rect_height, false);
	
	// Reset alpha to 1 for normal drawing
	draw_set_alpha(1);
	
	//draw_set_color(c_black);
    //draw_text(text_x, text_y, display_text); // Draw the text on the calculated position
}


// Draw text to let user know they can transform

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var text_x = cam_x + 16;
var text_y = cam_y + 16;
draw_text(text_x, text_y, display_text); 

// Calculate the position to draw the shadow text
var shadow_x = text_x + 2; // Add a horizontal offset for the shadow
var shadow_y = text_y + 2; // Add a vertical offset for the shadow

// Set the shadow color (e.g., black or darker color)
draw_set_color(c_black);
draw_text(shadow_x, shadow_y, display_text); // Draw the shadow text

// Calculate the size of the background rectangle
var rect_width = string_width(display_text) + 16; // Add padding on both sides
var rect_height = string_height(display_text) + 8; // Add padding on both top and bottom

// Set the background color with low opacity (e.g., c_white with an alpha value)
draw_set_alpha(0.5);

// Draw the background rectangle
draw_set_color(c_white);
draw_rectangle(text_x - 8, text_y - 4, text_x + rect_width, text_y + rect_height, false);

// Reset alpha to 1 for normal drawing
draw_set_alpha(1);

// Set the main text color (e.g., blue)
draw_set_color(c_black);
draw_text(text_x, text_y, display_text); // Draw the main text


//inform player to interact using F key
// Draw event of the player object
if (puzzleStone_show_text_timer > 0 && !collided_puzzleStone_active)
{
    draw_set_color(c_blue);
    draw_set_font(fnt_ComicSans_Small);

    var display_text = "Untuk mengaktifkan tekan F";
    
    var text_x = x - string_width(display_text) * 0.5;
    var text_y = y - 32;
    
    draw_text(text_x, text_y, display_text);
}

// for alert text when teleport with monster not eliminated
if (show_teleport_message_timer > 0)
{
    draw_set_font(fnt_ComicSans_Small);
    var display_text = "Kurasa kita harus menyingkirkan seluruh monster itu dulu";

    // Calculate the position to draw the text within the camera's view
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);

    var text_x = clamp(x - string_width(display_text) * 0.5, cam_x, cam_x + cam_w - string_width(display_text));
    var text_y = clamp(y - 32, cam_y, cam_y + cam_h);

    // Calculate the size of the background rectangle based on the text size
    var rect_width = string_width(display_text) + 16;
    var rect_height = string_height(display_text) + 8;

    // Calculate the position to draw the background rectangle
    var rect_x = text_x - 8; // Adding a padding of 8 pixels on both sides
    var rect_y = text_y - 4; // Adding a padding of 4 pixels on both top and bottom

	draw_set_alpha(0.5);//opacity
	
    // Draw the background rectangle
    draw_set_color(c_white);
    draw_rectangle(rect_x, rect_y-50, rect_x + rect_width, rect_y-50 + rect_height, false);

	draw_set_alpha(1);//opacity
    // Draw the text over the background
    draw_set_color(c_black);
    draw_text(text_x, text_y - 50, display_text);
}

if (interact_show_text_timer > 0)
{
    draw_set_color(c_blue);
    draw_set_font(fnt_ComicSans_Small);

    var display_text = "Tekan E untuk interaksi";
    
    var text_x = x - string_width(display_text) * 0.5;
    var text_y = y - 32;
    
    draw_text(text_x, text_y, display_text);
}

if (board_show_text_timer > 0)
{
    draw_set_color(c_blue);
    draw_set_font(fnt_ComicSans_Small);

    var display_text = "Klik kanan untuk membaca";
    
    var text_x = x - string_width(display_text) * 0.5;
    var text_y = y - 32;
    
    draw_text(text_x, text_y, display_text);
}




//Attack
draw_set_colour(c_blue);
draw_set_font(Font2);
draw_text(x-40,y-70,"ATK:");
draw_text(x-5,y-70,"1");

//draw_sprite(bkbg, 0, x-15,y-50)

//Text for clearing blockage
if (blockage_show_text_timer > 0)
{
    draw_set_color(c_red);
	
    draw_set_font(fnt_ComicSans_Small);

    var display_text = "Activate 2 puzzle untuk buka jalur";

    var text_x = oBlockage.x - 32;
    var text_y = oBlockage.y - 32;

    draw_text(text_x, text_y, display_text); // Draw the text on the calculated position
}

