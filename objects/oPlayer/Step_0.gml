if ((global.dialogueState == DialogueState.None) && (global.focusState == FocusState.None)) {
    // Kalau lagi gak ada dialog dan fokus kamera, ini buat ngambil input dari player
    key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));  // Cek input panah kiri atau huruf "A"
    key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));  // Cek input panah kanan atau huruf "D"
    key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));  // Cek input spasi atau "W" buat lompat
    mouse_attack = mouse_check_button_pressed(mb_left);  // Cek klik kiri mouse buat attack
    mouse_hook = mouse_check_button_pressed(mb_right);  // Cek klik kanan mouse buat grappling hook
}

// Update posisi health bar biar selalu di atas karakter
healthbar_x = x - (healthbar_width / 2);
healthbar_y = y - 50;

// Hitung pergerakan karakter
var move = key_right - key_left;  // Kalau pencet kanan +1, kiri -1, jadi tau arah

hsp = move * walksp;  // Horizontal speed, jalan kiri/kanan
vsp = vsp + grv;  // Tambah gravity ke vertical speed biar jatoh ke bawah

var previousY = y;  // Cek posisi Y karakter sebelumnya (buat tau lagi lompat atau enggak)

if (previousY == y) {
    sprite_index = sprites[0];  // Kalo gak lompat/jalan, pake sprite idle
}

previousY = y;  // Update previousY ke posisi sekarang

// Horizontal Collision
if (place_meeting(x + hsp, y, oWall)) {
    // Kalo ketemu tembok, gerak 1 pixel terus sampe nabrak
    while (!place_meeting(x + sign(hsp), y, oWall)) {
        x += sign(hsp);
    }
    hsp = 0;  // Set horizontal speed jadi 0 biar gak nembus tembok
}

x += hsp;  // Tambah nilai x sama hsp buat gerakin karakter

// Vertical Collision
if (place_meeting(x, y + vsp, oWall)) {
    // Sama kayak horizontal, tapi buat nabrak dari atas/bawah
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y += sign(vsp);
    }
    vsp = 0;  // Set vertical speed jadi 0 kalo udah di tanah
}

y += vsp;  // Tambah nilai y sama vsp buat lompat/jatuh

// Cek kalo karakter di tanah, bisa lompat
canjump--;
if ((canjump > 0) && (key_jump)) { 
    audio_play_sound(snJump, 1, false);  // Play suara lompat
    vsp = -10;  // Set vertical speed buat lompat ke atas
    canjump = 0;  // Setelah lompat, gak bisa lompat lagi sampai di tanah
}

if (place_meeting(x, y + 1, oWall)) {  // Cek kalo di tanah
    canjump = 5;  // Boleh lompat
    if (hsp != 0) {
        sprite_index = sprites[1];  // Pake sprite jalan kalo karakter gerak
    }
} else {
    if (sign(vsp) > 0) {
        sprite_index = sprites[3];  // Pake sprite jatuh
    } else {
        sprite_index = sprites[2];  // Pake sprite lompat
    }
}

if (place_meeting(x, y + 5, oWall)) {
    // Mainin suara landing pas karakter turun dari lompat/jatuh
    if (sprite_index == sPlayerKnightFall || sprite_index == sCatFall) {
        audio_play_sound(snLanding_Grass, 0.5, false);
    }
}

// Ganti arah sprite (flip) kalo arah geraknya beda
if (hsp != 0) image_xscale = sign(hsp); 

// Bagian attack
if (!transform) {
    attackdelay -= 1;  // Kurangin attack delay biar bisa attack lagi
    if (mouse_attack && (attackdelay < 0)) {
        audio_play_sound(snAttack, 1, false);  // Play suara attack
        sprite_index = sPlayerKnightAttack;  // Ganti sprite ke attack
        attackdelay = 10;  // Reset delay attack
        ScreenShake(2, 10);  // Efek shake layar

        // Tentuin arah slash based on arah karakter (kanan 0 derajat, kiri 180 derajat)
        var slashDirection = image_xscale > 0 ? 0 : 180;

        // Buat instance slash
        with (instance_create_depth(x, y, 0, oSlash)) {
            speed = 20;
            direction = slashDirection;
            image_angle = direction;
        }
    }

    // Gerakin karakter maju saat attack
    if (sprite_index == sPlayerKnightAttack) {
        var moveX = lengthdir_x(3, image_angle);  // Hitung gerak berdasarkan sudut
        if (image_xscale > 0 && !place_meeting(x + moveX, y, oWall)) {
            x += moveX;  // Gerak kanan kalo gak nabrak
        } else if (!place_meeting(x - moveX, y, oWall)) {
            x -= moveX;  // Gerak kiri kalo gak nabrak
        }
    }

    // Grappling Hook logic
    hook_timer--;
    if (has_hook) {
        if (mouse_hook && !active) {
            mx = mouse_x;  // Ambil posisi mouse
            my = mouse_y;
            var angle = point_direction(x, y, mx, my);  // Hitung sudut dari karakter ke mouse
            if ((image_xscale > 0 && (angle > 270 || angle < 90)) || (image_xscale < 0 && ((angle > 90 && angle < 270)))) {
                if (place_meeting(mx, my, oHanger_Hook)) {
                    active = true;  // Aktifin hook
                    hook_timer = room_speed * 1;  // Timer hook
                }
            }
        }

        if (active) {
            grv = 0.1;  // Bikin gravity lebih kecil kalo hook aktif
            x_move = (mx - x) * 0.05;
            y_move = (my - y) * 0.05;
            if (!place_meeting(x + x_move, y + y_move, oHanger_Hook)) {
                x += x_move;  // Gerakin karakter ke arah hook
                y += y_move;
            }
        }

        grv = 0.3;  // Balikin gravity normal

        if (hook_timer <= 0 || mouse_check_button_released(mb_right)) {
            active = false;  // Deaktifin hook kalo waktunya habis
        }
    }
}

// Activate Puzzle Stone
var objStone = instance_place(x + hsp, y, oPuzzleStone);
if (objStone != noone) {
    hsp = 0;
    if (!objStone.activated) {
        if (keyboard_check_pressed(ord("F"))) {
            if (objStone.valid == true) {
                objStone.sprite_index = sPuzzleStone_Active;
                objStone.activated = true;  // Aktifin puzzle stone
                activated_stone += 1;
                if (activated_stone == 2) {
                    global.focusState = FocusState.Active;  // Kamera fokus ke blockage
                    global.follow = oBlockage;
                    key_left = 0;
                    key_right = 0;
                    activated_stone = 0;
                    global.blockageState = BlockageState.None;  // Clear blockage
                }
            }
        }
    }
}

// Open Chest
var objChest = instance_place(x + hsp, y, oChest);
if (objChest != noone) {
    hsp = 0;
    if (!objChest.opened) {
        if (keyboard_check_pressed(ord("F"))) {
            objChest.sprite_index = sChestOpen;  // Ganti sprite chest ke open
            objChest.opened = true;
        }
    }
}

// Timer transformasi dan immortality
if (transform_cooldown > 0) transform_cooldown -= 1;
if (immortalTime > 0) immortalTime--;

// Timer teks blockage, puzzle stone, teleport, dan interaksi
if (blockage_show_text_timer > 0) blockage_show_text_timer -= 1;
if (puzzleStone_show_text_timer > 0) puzzleStone_show_text_timer -= 1;
if (show_teleport_message_timer > 0) show_teleport_message_timer -= 1;
if (interact_show_text_timer > 0) interact_show_text_timer -= 1;
if (board_show_text_timer > 0) board_show_text_timer -= 1;

// Power-up speed system
if (!place_meeting(x, y + 1, oWall)) {
    hsp = move * walksp * 0.5;  // Tambah speed di udara
}

if (has_speed1) walksp = 5;
if (has_speed2) walksp = 6;
if (has_speed3) walksp = 7;
if (has_speed4) walksp = 8;

// Cek kondisi dialog terakhir buat pindah ke ruangan akhir
if (global.dialogueState == DialogueState.None) {
    if (!instance_exists(oDialog_Level5_Cat) && !instance_exists(oDialog_Level5_Mentor) && !instance_exists(oDialog_Level5_RedCoatNPC) && !goGameEndRoom && final_cat_dialog_activated && final_mentor_dialog_activated && final_NPC_dialog_activated) {
        goGameEndRoom = true;
        room_goto_next();  // Pindah ke ruangan berikutnya
    }
}
