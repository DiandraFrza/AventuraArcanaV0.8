vsp = vsp + grv;  


var previousY = y;

if (previousY == y)  //If the player is not moving
{
    sprite_index = sSlime_Idle;
}

previousY = y;

//Horizontal Collision
if (place_meeting(x + hsp, y, oWall))
{
	//if there is no collision at one pixel besides object
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x += sign(hsp); //Move one pixel to right or left
	}
	hsp = -hsp;
}
//x is a built in property represent the x (horizontal) coordinate of object
 x += hsp; 

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
 

//we have collision with one pixel below us, 
//which means object is on the ground.
if (place_meeting(x, y + 1, oWall)) 
{

	if (hsp != 0)
	{
		sprite_index = sSlime_jump;
	}
}
else
{
    if (sign(vsp) > 0) // If object is moving down
    {
        sprite_index = sSlime_jump;
    }
    else // If object is moving up
    {
        sprite_index = sSlime_jump;
    }
}

//image_xscale will flip the sprite when it is -1
//sign(hsp) will return 1 if moving left else -1
if (hsp != 0) image_xscale = sign(-hsp) * size; 
image_yscale = size;

var _edge;

if (sign(hsp) == 1) //facing right
{
	_edge = place_meeting(x + 32, y + 32, oWall); //true if got collision
}
else if (sign(hsp) == -1) //facing right
{
	_edge = place_meeting(x - 32, y + 32, oWall);
}



// This checks if a collision was NOT found there, meaning we've hit a ledge.
if (!_edge)	//if not true, means that there is no platform or tile ahead
{
	// This ensures the enemy is grounded, so enemies in mid-air do not turn.
	if (place_meeting(x, y + 1, oWall))
	{
		// This makes the enemy turn.
		hsp = -hsp;
	}
}

