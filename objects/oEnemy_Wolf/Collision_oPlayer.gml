/// @description Insert description here
// You can write your code in this editor

if (oPlayer.immortalTime <= 0)
{
    audio_play_sound(snHit, 8, false);
    oPlayer.hp--;
    
    oPlayer.immortalTime = oPlayer.immortalDuration;
}
if (oPlayer.hp <= 0)
{
	room_goto(room_last);	
}
