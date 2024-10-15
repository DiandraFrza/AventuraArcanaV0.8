if(hp <= 0)
{
	instance_destroy();//Monster dies if hp <= 0
	instance_create_layer(x, y, layer, oKey); //boss monster drops key
}

teleport_timer--;
if (teleport_timer <= 0){


var newLocationX = 0;
var newLocationY = 0;

repeat(15){

 newLocationX = start_positionX + random_range(-rangeTeleport, rangeTeleport);
 newLocationY = start_positionY + random_range(-rangeTeleport, rangeTeleport);

var wallthere = collision_circle(newLocationX,newLocationY, teleport_RadialBuffer, oWall,0,0 );
// no wall there? -> let's teleport and break out of the repeat loop because we don't need it any more  
if (wallthere == noone){
  

  x = newLocationX;
  y = newLocationY;
  break;
  }

}




teleport_timer = irandom_range(teleport_timeMin , teleport_timeMax );

}

// draw for checking and debugging 
 draw_text(x,y-50, teleport_timer);

draw_set_alpha(0.1);

draw_circle_color(start_positionX,start_positionY, rangeTeleport,c_aqua, c_aqua, 0);
draw_set_alpha(1);

draw_set_alpha(0.4);
draw_circle_color(x,y, teleport_RadialBuffer, c_red, c_red, 0);
draw_set_alpha(1);

draw_self();