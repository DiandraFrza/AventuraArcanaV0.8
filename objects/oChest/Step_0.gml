
//Move one pixel down so that it can initially stay on ground
while (!place_meeting(x, y + 1, oWall))
{
	y += 1; 
}

if (opened && image_index >= 4)
{
	image_speed = 0; // Stop the animation
	if (potion)
	{
		instance_create_layer(x, y, layer, oPotion);
		potion = false;
	}
}