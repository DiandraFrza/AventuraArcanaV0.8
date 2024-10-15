while (!place_meeting(x, y + 1, oWall))
{
	//sign() return 1 if the value is positive else -1
	y += 1; //Move one pixel down so that it can initially stay on ground
}
