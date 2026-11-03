
#region [Vibecode] 
if /*(stop_chase == 0) and*/ (stopMovement = false) 
{
//Detecting Player
Detect_Range()

//Detecting Wall
Laser_Detection()

/// Pathing ///
Pathing()

/// Finding ///
Finding();

/// Jump /// - Shenvin broke this compared to last Resonance push 
if (should_jump = true) 
&& (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_collision,true,true))//if he touch ground
{
	yspd = -jump_spd
}
else if 
!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1+yspd,obj_collision,true,true)//otherwise not allowed
{
	should_jump = false 
}

if (yspd == 0)
{
	if (xspd != 0)
	{
		sprite_index = spr_nako_walk
		image_xscale = sign(xspd)
	}
	else
	{
		sprite_index = spr_nako
	}
}
else
{
	sprite_index = spr_nako_jump
	if (xspd != 0)
	{
	image_xscale = sign(xspd)
	}
}

//[Note] What ?
}
else
{
	if (nakoPhase == 0)
	{
		xspd = 0;
	}
}
#endregion

/*
if keyboard_check_pressed(vk_space)
{
	if (stop_chase = 0)
	{stop_chase = 1
	xspd = 0;
	yspd = 0;
	should_jump = 0}
	else
	{
		stop_chase = 0
	}
}*/


/// Movement
//charge towards player if vector distance is less than our max speed [Vibecode] 
if (point_distance(x,y,TargetX,TargetY) < max_spd)
{
	max_spd = abs(x - TargetX)
}
else
{
	max_spd = spd
}

#region Sensible Movement 
//Res' code (this works)  
if (point_distance(x,y,TargetX,TargetY) <= abs(dashLength + sprite_width * 5))
and (Target == RealTarget)
and alarm[0] = -1 {
alarm[0] = 60 + irandom(1) * 5
}	

if (dashDuration > 0) { //when dash is active 
	xspd = lengthdir_x(dashSpeed,dashDirection) //vector based on the dash speed and direction
	yspd = lengthdir_y(dashSpeed,dashDirection) // 	
	dashDuration -= dashTime //decrement dashTime from dashDuration (if 0, dash stops)
}
var _predictiveY = bbox_bottom + round(sprite_height/20) //helps with Collision

#endregion Sensible Movement 

/// Collision /// - [Vibecode] - [Repaired 50%] 
if instance_place(x + xspd,y ,obj_collision)
or place_meeting(bbox_left - xspd, y, obj_collision) //fix attempted 
or place_meeting(bbox_right + xspd, y, obj_collision) //fix attempted 
{
	xspd = 0;
}
if instance_place(x,y + 1 + yspd, obj_collision)
or place_meeting(x,_predictiveY,obj_collision) //fix attempted 
{
	yspd = 0;
}
else //[Note] Erm, so, if we're stuck in a wall just dont move? else... fall??? 
{
	/// Gravity /// [Vibecode] 
	if (yspd < term_vel) //Terminate Vel'koz? probably terminal velocity :shrug:
	{yspd += grav}
	else
	{yspd = term_vel}
}

/// Making it Move - sensible  
x += (xspd * max_spd)
y += yspd
