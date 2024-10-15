/// @description Transform to Human


if (other.transform)
{
	other.y -= 40;
	other.sprites = [sPlayerKnight, sPlayerKnightRun, sPlayerKnightJump, sPlayerKnightFall];
	other.transform = false;
	instance_destroy();
}