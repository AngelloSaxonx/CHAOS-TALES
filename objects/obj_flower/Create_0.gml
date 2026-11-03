/// @description oPlayer obj_player 

event_inherited() //[Reconsider] [Low Priority] - player is a child of its hitbox, wat 
Health_bar = 10//obj_stats.hp
test_text = 0; //nonsense variable 
scr_contol_setup() //initialize presumably potato script, or the Prologue obj would allow for Z or gamepad 

mask_spr = spr_flower; //[Vibecode] [Refactor] - redundant variables and nonsense 
idle_spr = spr_flower;
walk_spr = spr_flower_walk;
run_spr = spr_flower_run;
ledge_spr = spr_flower_ledge
jump_spr = spr_flower_jump;
dash_air_spr = spr_flower_round;

attack_spr[0] = spr_flower_stab_final
attack_spr[1] = spr_flower_stab_body
attack_spr[2] = spr_flower_stab_dagger
attack_spr[3] = spr_flower_stab_left_arm
image_moving = 0; //bruh 
hurted = 0; //... 
knockX = 0;
knockY = 0;
face = 1; //... 

run_type = 0; //labels are a good thing to have if this is a switch statement...  
move_dir = 0; //an angle, probably 
move_spd = 2 //pixels per frame 
xspd = 0;
yspd = 0;

grav = .275;
term_vel = 4;
on_ground = true;
on_water = false
in_transition = false
ledge_in = false

can_jump = true // in case
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 16;
//it'd be peak cinema if it didn't need to be refactored :'( this'll take me time 
jspd[0] = -3*2; //Shenvin: Double the jump
jump_hold_frames[1] = 12;
jspd[1] = -5*2; //Shenvin: This too
ledge_jspd = 6

can_dash = true;
dash_distance = 40;
dash_time = 10; //see oNako for sensible dash code 
ledge_fall_time = 20

can_run = true; //sometimes Shenvin uses booleans and sometimes real numbers, depends on weather 
double_jump = true;

scr_state_idle = function()
{
	if (sprite_index == spr_flower_hurt) && (hurted == 0)
	{
		hurted = 1
		alarm[0] = 40;
		xspd = knockX;
		yspd = knockY;
	}
	
	if (hurted == 1) && (place_meeting(x,y+yspd,obj_collision)) //so sometimes he knows to use place_meeting
	{sprite_index = idle_spr;hurted = 0;knockX = 0;knockY = 0;}
	
	
	if (hurted == 0) && (!instance_exists(obj_textbox))
	{
    move_dir = right_key - left_key; //if we have keys for movement, why not Z and gamepad? 

    if move_dir != 0 {face = move_dir};

    if (move_dir != 0){
        xspd = move_dir * move_spd;
    } else {
       //xspd *= .98;
       //if (xspd < 0.05) or (xspd > 0.05) xspd = 0;
	   xspd = 0;
    }
	}

    //Attack
	#region
	if (!instance_exists(obj_textbox))
	{
	Attack_stage_for_player() //i am scared to check 
	}
	#endregion
	
    if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_collision)
    {
    
    }
	
	if (on_water = true)
	{
		state = scr_state_swim; //bruh
	}
	
	if !place_meeting(x,y,obj_interact)
	{
		if (hurted == 0) && (!instance_exists(obj_textbox))
		{
	    scr_state_jump()
		}
	}
    scr_movement(); //not this script again :NotLikeRowlet: 
	
	//[Vibecode] [Refactor] one of the worst pieces of code left to us, and that is saying something
	var coll = instance_place(x+(move_dir*move_spd),y,obj_collision)
	if ( (coll && (coll.bbox_top > bbox_top+1))) //this coll junk is textbook vibeslop.... and wow this is bad
	&& !(instance_place(x,y+1,obj_collision))
	{
		var stop_if_up = collision_rectangle(coll.bbox_left,coll.bbox_top-1,coll.bbox_right,coll.bbox_top,obj_collision,false,true)
		if (stop_if_up == noone) || (stop_if_up != noone && stop_if_up == id) || (stop_if_up != noone && stop_if_up != id && 
		((coll.bbox_right > stop_if_up.bbox_right && move_dir = -1) || (coll.bbox_left < stop_if_up.bbox_left && move_dir = 1)) )
		{
			state = scr_wall_recovery
			xspd = 0;
			yspd = 0;
		}
	}

	if (hurted == 0)
	{
	if on_ground
	//Idle
	{
		image_speed = 1
		if abs(xspd) == 0 
	    {
			if (from != noone)
			{
				if sprite_index != attack_spr[0]
		        {image_index = 0}
				sprite_index = attack_spr[0]
			}
			else
			{
				if sprite_index != idle_spr
		        {image_index = 0}
				sprite_index = idle_spr
			}
		}
		//Walk
		
			if sprite_index != walk_spr
		    {image_index = 0}
			sprite_index = walk_spr
	}
	//Jump
	else
	{    
	//Airdash
		
		//Jump
			if sprite_index != jump_spr
		    {
				if (jump_key) {image_index = 0} // if you press jump
				else {image_index = 2} // Otherwise act like falling
			}
			else
			{
				if (jump_key_pressed && can_jump) {image_index = 0} //Double jumping refresh animation
			}
			sprite_index = jump_spr
		
	}
	}
};

scr_wall_recovery = function()
{
	//grabbed
	if sprite_index != ledge_spr
    {image_index = 0}
	sprite_index = ledge_spr
	
	if (image_index > 1)
	{
		//start rolling
		if (ledge_in == false)
		{yspd = -ledge_jspd; ledge_in = true}
		if (yspd < 0)
		{
			if (image_index >= image_number-2)
			{
				image_index = 2
			}
			xspd = (face*move_spd)
		}
		//staring backward
		else if (!place_meeting(x,y+1,obj_collision)) && (yspd >= 0){
			//if doesn't land in time, switch to idle
			if (ledge_fall_time <= 0)
			{
				ledge_fall_time = 20;
				state = scr_state_idle;
				ledge_in = false;
				image_index = 2;
				xspd = 0;
			}
			// if have time, still rolling
			else
			{
				ledge_fall_time--;
				if (image_index >= image_number-2)
				{
					image_index = 2
				}
				xspd = (face*move_spd)
			}
		}
		//if land in time, landing animation
		else if (place_meeting(x,y+1,obj_collision)) && (yspd >= 0)
		{
			if (ledge_fall_time > 0)
			{
			if (ledge_fall_time > 5) {ledge_fall_time = 5}
			image_index = image_number-1
			image_speed = 0;
			ledge_fall_time -= 0.5;
			}
			
			if (ledge_fall_time <= 0)
			{image_speed = 1;state = scr_state_idle; ledge_in = false;ledge_fall_time = 20;}
			xspd = 0
		}
		//Grav
		if !place_meeting(x,y+1,obj_collision)
		{
			if (yspd < term_vel)
			{yspd += grav}else
			{yspd = term_vel}
		}
	}
	//Coll
	if place_meeting(x,y+yspd,obj_collision)
	{
		yspd = 0
	}
	if place_meeting(x+xspd,y,obj_collision)
	{
		xspd = 0;
	}
	//Movement
	x += xspd
	y += yspd
}

state = scr_state_idle;