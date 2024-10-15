
if (global.blockageState == BlockageState.None)
{
	if (Timer < 100)
	{
		oBlockage.sprite_index = sBlockage_Active;	
	}
    if (Timer > 0)
    {
        Timer -= 1;
    }
    else
    {
		visible = false;	//make blockage invisible
		if (Timer > -120)
		{
			Timer -= 1;	
		}
		else
		{
			global.follow = oPlayer;	//destroy after a period
			global.focusState = FocusState.None;
			instance_destroy();
		}
	}
}