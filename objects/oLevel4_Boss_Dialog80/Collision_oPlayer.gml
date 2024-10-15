/// @description Insert description here
// You can write your code in this editor


global.focusState = FocusState.Active;
//global.follow = oEnemyWolf_Big;
oPlayer.key_right = 0;
oPlayer.key_left = 0;
oPlayer.key_jump = 0;
oPlayer.mouse_attack = 0;
oPlayer.mouse_hook = 0;

// Step event
if (!dialogCreated)
{
    // Check the timer for the delay
    if (timer < delay)
    {
        timer++;
    }
    else
    {
        instance_create_layer(x, y, layer, oDialog_Level4_Boss81);
        dialogCreated = true; 
    }
}

if (dialogCreated)
{
    if (global.focusState == FocusState.Active)
    {
        if (!instance_exists(oDialog_Level4_Boss81))
        {
            global.focusState = FocusState.None;
            global.follow = oPlayer;
        }
    }
}
