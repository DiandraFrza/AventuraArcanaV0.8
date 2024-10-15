/// @description Insert description here
// You can write your code in this editor
if (oPlayer.hp < 20)	//the player can only drink the potion when it is not on full health
{
	audio_play_sound(snHit, 8, false);
	oPlayer.hp++;//heals player
	instance_destroy();
}
// the potion will stay there if player have full health



