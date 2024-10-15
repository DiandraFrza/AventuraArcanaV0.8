
//Move one pixel down so that it can initially stay on ground
while (!place_meeting(x, y + 1, oWall))
{
	y += 1; 
}