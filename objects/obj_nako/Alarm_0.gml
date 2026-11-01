/// @description Switch Stances
//Nako cylces through 4 components of its attack
//this would work fine if Nako did not clip into walls and platforms 
//will debug later, but idk why Nako is able to so easily go out of bounds 

if (nakoPhase + 1 == nakoResetMax) 
{ 
	nakoPhase = 0 //reset 
}
else nakoPhase++ //increment phase by 1 

switch(nakoPhase)
{
	case 0: //Halt - 1 second of warning 
	stopMovement = true 
	dashDirection = point_distance(x,y,TargetX,TargetY) 
	//point_distance(TargetX,TargetY,x,y) //update the target 
	alarm[0] = 60 
	if ((image_xscale > 0) or xspd > 0) //not mirrored 
	and (y > TargetY) //the target is above us  
	and (x < TargetX) //target is to the right 
	{
		sprite_index = spr_nako_dash_swing_1 //preparing to strike 
		image_xscale = 1 //don't mirror 
	}
	if ((image_xscale > 0) or xspd > 0) //not mirrored 
	and (y < TargetY) //the target is below us  
	and (x < TargetX) //target is to the right 
	{
		sprite_index = spr_nako_dash_swing_3 //preparing to strike 
		image_xscale = 1 //don't mirror 
	}	
	if ((image_xscale < 0) or (xspd < 0)) //Target Behind  
	and (y > TargetY) //the target is above us  
	and (x > TargetX) //target is to the left 
	{
		sprite_index = spr_nako_dash_swing_1 //preparing to strike 
		image_xscale = -1 //mirror 
	}	
	if ((image_xscale < 0) or (xspd < 0)) //Target Behind 
	and (y < TargetY) //the target is below us  
	and (x < TargetX) //target is to the left 
	{
		sprite_index = spr_nako_dash_swing_3 //preparing to strike 
		image_xscale = -1 //mirror 
	}		
	break; 

	case 1: //Dash Attack! 
	stopMovement = true 
	attackInProgress = true //activate hitbox 
	dashDuration = 15 //X frames of cat danger / danger cat 
	with (instance_create_depth(x,y,depth + 1, obj_nako_slash_hitbox)) {
		creatorId = other.id //defined on hitbox, tracks nako's position 
		//xspd = other.xspd 	
	}
	
	alarm[0] = 60 
	if sprite_index = spr_nako_dash_swing_1 
	//and (image_xscale > 0) //not mirrored 
	{
		sprite_index = spr_nako_dash_swing_2 //upper cut 
	}  
	if sprite_index = spr_nako_dash_swing_3 
	//and (image_xscale > 0) //not mirrored 
	{
		sprite_index = spr_nako_dash_swing_4 //down slash 
	}  	
	
	break; 
	
	case 2: //Pose after swing 
	stopMovement = false 
	if sprite_index = spr_nako_dash_swing_2 
	sprite_index = spr_nako_dash_swing_1
	if sprite_index = spr_nako_dash_swing_4
	sprite_index = spr_nako_dash_swing_3
	alarm[0] = 22 //the duration of obj_nako_slash_hitbox 
	
	break; 
	
	case 3: //Patrol again 
	stopMovement = false  
	alarm[0] = -1 //disable the alarm, step event can activate it 
	sprite_index = spr_nako //reset the sprite 
	
	break; 

}	
