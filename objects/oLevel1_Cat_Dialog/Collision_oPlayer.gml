/// @description Insert description here
// You can write your code in this editor

oPlayer.key_right = 0;
oPlayer.key_left = 0;
oPlayer.key_jump = 0;
oPlayer.mouse_attack = 0;
oPlayer.mouse_hook = 0;
other.interact_show_text_timer = 10;

if (keyboard_check(ord("E")))
{
	instance_create_layer(x, y, layer, oDialog_Level1_Cat);
}

if (!dialogCreated)
{
    instance_create_layer(x, y, layer, oDialog_Level1_Cat);
    dialogCreated = true; 
}