
#region
if (stop_chase == 0) and (stopMovement == false) 
{
//Detecting Player
Detect_Range()

//Detecting Wall
Laser_Detection()

/// Pathing ///
Pathing()

/// Finding ///
Finding();

/// Jump ///
if (should_jump = true) 
&& (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_collision,true,true))//if he touch ground
{
	yspd = -jump_spd
}
else if 
!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1+yspd,obj_collision,true,true)//otherwise not allowed
{
	should_jump = 0
}

}
#endregion


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
}


/// Collision ///
if instance_place(x+xspd,y,obj_collision)
{
	xspd = 0;
}

if instance_place(x,y+1+yspd,obj_collision)
{
	yspd = 0;
}
else
{
	/// Gravity ///
	if (yspd < term_vel)
	{yspd += grav}else
	{yspd = term_vel}
}


/// Movement
//charge towards player if vector distance is less than our max speed 
if (point_distance(x,y,TargetX,TargetY) < max_spd)
{max_spd = abs(x - TargetX)}
else
{max_spd = spd}

//Player detected in Dash range.. 
if (point_distance(x,y,TargetX,TargetY) <= dashLength + sprite_width * 5)
and alarm[0] = -1 {
alarm[0] = 60 	
}	

if (dashDuration > 0) { //when dash is active 
	xspd = lengthdir_x(dashSpeed,dashDirection) //vector based on the dash speed and direction
	yspd = lengthdir_y(dashSpeed,dashDirection) // 	
	dashDuration -= dashTime //decrement dashTime from dashDuration (if 0, dash stops)
}

/// Making it Move 
x += (xspd * max_spd)
y += yspd
