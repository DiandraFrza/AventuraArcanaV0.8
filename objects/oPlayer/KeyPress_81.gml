/// @description Transform to cat


if (!transform && transform_cooldown <= 0)
{
    sprites = [sCatIdle, sCatRun, sCatJump, sCatFall];
    transform = true;
    transform_cooldown = room_speed * 5; // 5 seconds cooldown
}
else if (transform && transform_cooldown <= 0)
{
    if (!place_meeting(x, y - 30, oWall))
    {
        y -= 40;
        sprites = [sPlayerKnight, sPlayerKnightRun, sPlayerKnightJump, sPlayerKnightFall];
        transform = false;
		transform_cooldown = room_speed * 5;
    }
}
