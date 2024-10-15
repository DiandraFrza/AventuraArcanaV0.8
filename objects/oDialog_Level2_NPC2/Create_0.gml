/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if(oPlayer.quest1_accept && !oPlayer.quest1_complete)
{
	dialog.add(sNPC_Traveller_Dialog, "Come back to me after you defeat 5 monsters.");
}

if (!oPlayer.quest1_accept && !oPlayer.quest1_complete)
{
	dialog.add(sNPC_Traveller_Dialog, "Hi, I am a traveller pass by here. But now I am trapped here by the monsters.");
	dialog.add(sNPC_Traveller_Dialog, "You seems to be strong. There are some unreachable place here.");
	dialog.add(sNPC_Traveller_Dialog, "I will give you my grapling hook if you defeat 5 monsters for me. You can use it to go to unreachable place.");
	dialog.add(sPlayer_Dialog, "Sure. I will get back as soon as I can.");
	oPlayer.quest1_accept = true;
}

if (oPlayer.quest1_accept && oPlayer.quest1_complete)
{
	if (!oPlayer.has_hook)	//player dont have hook yet
	{
		dialog.add(sNPC_Traveller_Dialog, "You really did it! Here, I give you the grapling hook.");
		dialog.add(sNPC_Traveller_Dialog, "Hover your mouse on the wooden hanger you can see on the wall and click right mouse button to use it.");
		dialog.add(sNPC_Traveller_Dialog, "Note that you can only use the hook when the hanger is in front of you. It is impossible to use the hook on hanger that is behind you.");
		dialog.add(sPlayer_Dialog, "I see. Thank you.");
		instance_create_layer(x - 110, y - 65, layer, oGraplingHook);
	}	
	else
	{
		dialog.add(sPlayer_Dialog, "Can you explain to me again on how to use the grapling hook?");
		dialog.add(sNPC_Traveller_Dialog, "Sure. You  need to hover your mouse on the wooden hanger you can see on the wall and click right mouse button to use it.");
		dialog.add(sNPC_Traveller_Dialog, "Note that you can only use the hook when the hanger is in front of you. It is impossible to use the hook on hanger that is behind you.");
		dialog.add(sPlayer_Dialog, "I see. Thank you.");
	}
}



