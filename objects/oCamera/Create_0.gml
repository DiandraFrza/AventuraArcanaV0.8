/// @description Set Up Camera

index = 0;
cam = view_camera[index];
global.follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;


shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;