with (other) //the other here is the enemy object that slash collide
{				//code inside will be applied to the enemy object
	audio_play_sound(snHit, 8, false);
	if (oPlayer.quest1_accept && !oPlayer.quest1_complete)	//the quest not complete
	{
		if (hp - 1 == 0)
		{
			oPlayer.quest1_targetCount ++;
			if (oPlayer.quest1_targetCount == 5)
			{
				oPlayer.quest1_complete = true;	
			}
		}
	}
	hp--;
	flash = 3;
	hitfrom = other.direction;
	
	// Make the enemy face and move towards the direction of the attack
    if (hitfrom == 0) // Attack from the right
    {
        direction = 0; // Set the enemy's direction to face right
        hsp = -2; // Set the enemy's horizontal speed to move right
    }
    else if (hitfrom == 180) // Attack from the left
    {
        direction = 180; // Set the enemy's direction to face left
        hsp = 2; // Set the enemy's horizontal speed to move left
    }
}

instance_destroy();