if(hp <= 0)
{
	instance_destroy();//Monster dies if hp <= 0
	instance_create_layer(x, y, layer, oHealPotion); //boss monster drops heal potion
}
var collWall = collision_point(x,y+2, oWall,0,0  );


    if (collWall != noone){ 
		
		 gravity = 0;
		 speed = 1;
		 if (setOnceDir == false) {
		 direction = choose(0,180);
		 
		 setOnceDir = true;
		 }
		 
		} else { gravity = 0.1;   }


jumpTimer--;

if (jumpTimer <= 0){
		 setOnceDir = false;
 if (direction ==   0){ direction = 45;  }
 if (direction == 180){ direction = 135;  }		 
		 
		 
 speed = random_range(3,4);
 
jumpTimer = irandom_range(120,180);

}

//short life span

durationLimit -= 1;
if (durationLimit < 0)
{
	instance_destroy();
}