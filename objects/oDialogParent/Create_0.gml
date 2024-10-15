
dialog = new Dialogue();

key_next = ord("F");

showing_dialog = false;

current_dialog = {};

alpha = 0;

enum DialogueState
{
    None,
    Active
}

global.dialogueState = DialogueState.None;