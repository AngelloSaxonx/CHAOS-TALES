/// @description oPlayer obj_player 

event_inherited() //[Reconsider] [Low Priority] - player is a child of its hitbox, wat 
Health_bar = 10//obj_stats.hp
test_text = 0; //nonsense variable 
scr_contol_setup() //initialize presumably potato script, or the Prologue obj would allow for Z or gamepad 

mask_spr = spr_flower; //[Vibecode] [Refactor] - redundant variables and nonsense 
idle_spr = spr_flower;
walk_spr = spr_flower_walk;
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


move_spd = 2.5 //pixels per frame  //viktorery: LET IT BE IN THE OPEN IM STURGGLING TO FIND IT


xspd = 0;
yspd = 0;

grav = 0.5;
term_vel = 4;
on_ground = true;
on_water = false
in_transition = false
ledge_in = false

jumpMax = 1; 

jumpCount = 0;
jumpHoldTimer = 0;

jumpHoldFrames = 20;

//buffered jump
bufferTime = 8; 
jumpKeyBuffered = 0;
jumpKeyBufferTimer = 0;


//coyote time
coyoteHangFrames = 2; 
coyoteHangTimer = 0;

coyoteJumpFrames = 7; 
coyoteJumpTimer = 0;
//it'd be peak cinema if it didn't need to be refactored :'( this'll take me time / vik: i got you
jspd = -4; //Shenvin: Double the jump




can_dash = true;
dash_distance = 40;
dash_time = 10; //see oNako for sensible dash code 
ledge_fall_time = 20

can_run = true; //sometimes Shenvin uses booleans and sometimes real numbers, depends on weather 
double_jump = true;

scr_state_idle = function()
{
	
    move_dir = right_key - left_key; //if we have keys for movement, why not Z and gamepad? 

    if move_dir != 0 {face = move_dir};

    
    xspd = move_dir * move_spd;
    

    
	
	
	
	if !place_meeting(x,y,obj_interact)
	{
		if !instance_exists(obj_textbox)
		{
	    scr_state_jump()
		}
	}
    
    
    scr_movement(); //not this script again :NotLikeRowlet: 
	
	
	if on_ground
	//Idle
	{
		image_speed = 1
		if abs(xspd) == 0 
	    {
			if sprite_index != idle_spr {image_index = 0} 
            sprite_index = idle_spr
			
		}
		//Walk
		
        if abs(move_dir) == 1
        {
            
			if sprite_index != walk_spr
		    {image_index = 0}
			sprite_index = walk_spr
            
        }
        
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
				if (jump_key && on_ground=true) {image_index = 0} //Double jumping refresh animation
			}
			sprite_index = jump_spr
		
	}
	
};


state = scr_state_idle;