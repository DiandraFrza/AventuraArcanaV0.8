vsp = vsp + grv;  

//Vertical Collision
if (place_meeting(x, y + vsp, oWall))
{
	//if there is no collision at one pixel up and down of object,
	//which means that the object is in air
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		//sign() return 1 if the value is positive else -1
		y += sign(vsp); //Move one pixel down so that it can initially stay on ground
	}
	vsp = 0;
}
//y is a built in property represent the y (vertical) coordinate of object
 y += vsp; 

