if (place_meeting(x - hsp, y, oWall))
{
	x += hsp;
}

if (place_meeting(x + hsp, y, oWall))
{
	x -= hsp;
}

if (other.y < y && !place_free(x , y + vsp))
{
	move_contact_solid(90, 8);
	vsp = 0;
}

if (place_meeting(x , y + vsp, oWall))
{
	vsp = 0;
	move_contact_solid(270, 12);
}