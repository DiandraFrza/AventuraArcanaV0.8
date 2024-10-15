//Rage Mode	
	if (place_meeting(x, y, oPlayer)) 
{
	speed = 10; //Speed increases if player touches enemy
}
if (speed = 10) 
{
	sprite_index = eyerage; //change to rage sprite in rage mode
}

if(hp <= 0) instance_destroy();//Monster dies if hp <= 0
