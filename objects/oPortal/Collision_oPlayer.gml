
if (instance_number(oEnemy_Wolf) + instance_number(oSlime) == 0)
{
	room_goto(targetRoom);
	other.x = targetX;
	other.y = targetY;
}
else
{
	other.x = targetX_same;
	other.y = targetY_same;
	other.show_teleport_message_timer = 3 * room_speed;
}