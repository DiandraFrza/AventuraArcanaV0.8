/// @description Update Camera

//Update destination
if (instance_exists(global.follow)) //If player exist
{
	xTo = global.follow.x;
	yTo = global.follow.y;
}
     
	 
//Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half + buff, room_width - view_w_half-buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half-buff);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half)

if (layer_exists("VillageFarTreesBG") && layer_exists("VillageCloudsBG"))
{
	layer_x("VillageFarTreesBG", x/2);
	layer_x("VillageCloudsBG", x/2);
	layer_x("VillageNearTreesBG", x/4);
}




