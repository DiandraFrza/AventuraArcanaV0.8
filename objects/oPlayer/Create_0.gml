//Health
hp = 20;  // Ini health poin karakter lo, mulai dari 20
hp_max = hp;  // Batas maksimal health juga diset sama kayak health awal (20)

// Ukuran health bar biar bisa nunjukin health player
healthbar_width = 100;  // Lebar health bar-nya 100 pixel
healthbar_height = 12;  // Tinggi health bar-nya 12 pixel
healthbar_x = x - (healthbar_width/2);  // X position health bar, di tengah karakter
healthbar_y = y - 50;  // Y position health bar, di atas karakter sekitar 50 pixel

//Status speed power up
has_speed1 = false;  // Kalau ini true, berarti lo dapet speed level 1
has_speed2 = false;  // Sama kayak atas, ini buat speed level 2
has_speed3 = false;  // Speed level 3
has_speed4 = false;  // Speed level 4, makin cepet

//Movement variables
hsp = 0;  // Horizontal speed, ini buat gerak ke kiri/kanan
vsp = 0;  // Vertical speed, ini buat lompat atau jatoh ke bawah
grv = 0.3;  // Gravity, biar karakter jatoh kayak di dunia nyata
walksp = 4;  // Kecepatan jalan normal karakter
canjump = 0;  // Variable ini nge-track kapan lo bisa lompat, 0 berarti ga bisa lompat

//Combat & attack delay
attackdelay = 0;  // Delay buat serangan, jadi ga bisa nge-spam attack
durationLimit = 10;  // Lama durasi buat sesuatu, misal skill atau power-up

//Quest progress
quest1_accept = false;  // Apakah quest 1 udah diterima
quest1_complete = false;  // Apakah quest 1 udah selesai
quest1_targetCount = 0;  // Ngitung jumlah target buat quest 1

//Final dialog states
final_mentor_dialog_activated = false;  // Nge-track apakah dialog mentor udah selesai
final_cat_dialog_activated = false;  // Nge-track dialog sama karakter kucing
final_NPC_dialog_activated = false;  // Nge-track dialog sama NPC terakhir
goGameEndRoom = false;  // Kalau true, karakter bakal pindah ke room akhir

//Grappling Hook system
has_hook = false;  // Nge-track apakah lo udah punya hook atau belum
mx = x;  // Koordinat X buat grappling hook
my = y;  // Koordinat Y buat grappling hook
active = false;  // Apakah hook lagi aktif atau nggak
hook_timer = 0;  // Timer buat hook aktifnya berapa lama

//Transform & cooldown system
transform = false;  // Apakah karakter udah berubah atau belum
transform_cooldown = 0;  // Timer buat cooldown transformasi

//Immortal/invincibility system
immortalTime = 0;  // Timer buat waktu karakter kebal (invincible)
immortalDuration = room_speed * 1;  // Berapa lama karakter kebal, disesuaikan sama kecepatan room

//Teks buat blockage atau puzzle stone
blockage_show_text_timer = 0;  // Timer buat nunjukin teks pas karakter ketemu blockage
puzzleStone_show_text_timer = 0;  // Timer buat nunjukin teks pas ketemu puzzle stone aktif

//Tracking status puzzle stone
collided_puzzleStone_active = false;  // Nge-track apakah puzzle stone yang ketabrak udah aktif atau belum

//Alert teleport system
show_teleport_message_timer = 0;  // Timer buat nunjukin alert kalo teleportasi pas monster belum dikalahin

//Teks interaksi NPC
interact_show_text_timer = 0;  // Timer buat nunjukin alert 'Press E' pas bisa ngobrol sama NPC

//Sprite array buat animasi karakter
sprites = [sPlayerKnight, sPlayerKnightRun, sPlayerKnightJump, sPlayerKnightFall];  // List sprite karakter: idle, run, jump, fall

//Teks papan tulis (board)
board_show_text_timer = 0;  // Timer buat teks di papan tulis (mungkin pas lagi interaksi)


//Puzzle tracking system
activated_stone = 0;  // Ngitung berapa puzzle stone yang udah aktif

//Enum buat fokus kamera
enum FocusState  
{
    None,  // Gak ada fokus
    Active  // Fokus aktif ke target
}

//Global camera state
global.focusState = FocusState.None;  // Mulainya kamera gak ada fokus ke target
