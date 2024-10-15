move_towards_point(oPlayer.x,oPlayer.y,spd);

image_angle = direction;

if (place_meeting(x, y, oWall)) instance_destroy();

if(hp <= 0) instance_destroy();//Monster dies if hp <= 0