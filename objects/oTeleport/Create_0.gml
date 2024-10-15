hp = 10;//health

start_positionX = x;  // start position
start_positionY = y;

rangeTeleport = 150; // radial spawning range around spawning point

// teleporting
teleport_timeMin = 40;  // run down timer that triggers teleportation
teleport_timeMax = 100;

teleport_time = 180;
teleport_timer = teleport_time;

teleport_RadialBuffer = 20; // small bubble as a failsave where to spawn

alarm[0] = 120; // Shoot every 2 seconds