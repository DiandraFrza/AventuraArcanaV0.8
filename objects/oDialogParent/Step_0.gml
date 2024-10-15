
if (showing_dialog == false)
{
	if (dialog.count() <= 0)
	{
		instance_destroy();
		return;
	}
	
	global.dialogueState = DialogueState.None;
	current_dialog = dialog.pop();
	showing_dialog = true;
}
else
{
	global.dialogueState = DialogueState.Active;
	if (keyboard_check_released(key_next))
	{
		showing_dialog = false;
		global.dialogueState = DialogueState.None;
		alpha = 0;
	}
}

if (keyboard_check(vk_space))
{
	global.dialogueState = DialogueState.None;
	instance_destroy();	
}