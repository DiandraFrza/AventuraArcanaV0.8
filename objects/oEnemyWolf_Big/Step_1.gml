if (hp <= 0)
{
	with (instance_create_layer(x, y, layer, oDead_Wolf))
	{
		direction = other.hitfrom; //hitfrom here have the direction of slash(degree)
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction)-2;
		image_xscale = sign(hsp) * other.size; //face towards the direction of slash that kill it
		image_yscale = other.size;
	}
	instance_create_layer(x, y, layer, oKey);
	instance_create_layer(x + 10, y, layer, oHealPotion);
	instance_create_layer(x - 10, y, layer, oHealPotion);
	instance_create_layer(x, y, layer, oHealPotion);
	instance_destroy();
}