vsp = vsp + grv;  

waitTime--;
if (waitTime == 0)
{
	hsp = walksp;	
}

var previousX = x;

if (previousX == x)  //If the player is not moving
{
    sprite_index = sNPC2;
}

previousX = x;

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

 
 
if (hsp != 0) //if moving
{
	sprite_index = sNPC2Run;
}