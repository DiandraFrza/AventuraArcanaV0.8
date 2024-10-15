if (hp <= 0)
{
	var no = choose(0,1,2);
	if (no == 0)
	{
		instance_create_layer(x,y,layer, oHealPotion);
	}
	with (instance_create_layer(x, y, layer, oSlime_Die))
	{
		audio_play_sound(snDeath, 10, false);
		direction = other.hitfrom; //hitfrom here have the direction of slash(degree)
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction)-2;
		image_xscale = sign(hsp) * other.size; //face towards the direction of slash that kill it
		image_yscale = other.size;
	}

	instance_destroy();
}

if (instance_exists(oPlayer))
{
	if (point_distance(oPlayer.x,oPlayer.y, x, y) < 300)
	{
		countdown --;
		if (countdown <= 0)
		{
			countdown = countdownrate;
			
			var playerDirection = point_direction(x, y, oPlayer.x, oPlayer.y);
			var slashDirection = (playerDirection > 90 && playerDirection < 270) ? 180 : 0;
	
		    with (instance_create_depth(x, y, 0, oSlash_Enemy))
		    {
		        speed = 10;
		        direction = slashDirection;
		        image_angle = direction;
		    }
		}
	}
}



