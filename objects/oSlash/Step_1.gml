if (place_meeting(x, y, oWall)) instance_destroy();

durationLimit -= 1;
if (durationLimit < 0)
{
	instance_destroy();
}