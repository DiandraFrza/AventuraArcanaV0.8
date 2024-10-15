if (done == 0)
{
	vsp = vsp + grv;  

	//Horizontal Collision
	if (place_meeting(x + hsp, y, oWall))
	{
		//if there is no collision at one pixel besides object
		while (!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp); //Move one pixel to right or left
		}
		hsp = 0;
	}
	//x is a built in property represent the x (horizontal) coordinate of object
	 x += hsp; 

	//Vertical Collision
	if (place_meeting(x, y + vsp, oWall))
	{
		if (vsp > 0)
		{
			done = 1;
		}
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
}

// Enemy dying animation
if (done == 1)
{
    sprite_index = sEnemy_Wolf_Die; // Set the dying animation sprite

    if (image_index >= 6) // Check if the animation has reached the last frame
    {
        // Stop repeating the dying animation and deactivate the enemy
        image_index = 6;
		image_speed	= 0;
    }
}
