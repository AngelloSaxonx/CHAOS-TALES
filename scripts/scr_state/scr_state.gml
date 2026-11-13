

function scr_state_jump(){
    
    
    if jump_key_pressed
    {
        jumpKeyBufferTimer = bufferTime;
        
    }
    if jumpKeyBufferTimer > 0
    {
        jumpKeyBuffered = 1;
        jumpKeyBufferTimer--;
    }else{
        jumpKeyBuffered = 0;
    }
    //reset jump count
    if on_ground{
        
        jumpCount = 0;
        jumpHoldTimer = 0;
        coyoteJumpTimer = coyoteJumpFrames;
        
        
    } else {
        coyoteJumpTimer--;
        if jumpCount == 0 and coyoteJumpTimer <= 0 {jumpCount = 1; };
    }
    //jump
        
        if jumpKeyBuffered and jumpCount < jumpMax
        {
            //reset buffer
            jumpKeyBuffered = false;
            jumpKeyBufferTimer = 0;
            
            //increase number of perfomed jumps
            jumpCount++;
            fallendowntimer = 0
            
            //jump
            jumpHoldTimer = jumpHoldFrames;
            
            on_ground = false
        }
        //jump based on holding
        if jumpHoldTimer>0
        {
            yspd = jspd;
            
            jumpHoldTimer--;
        }
        if not jump_key{
            jumpHoldTimer = 0;
        }  
	
	
    
} //vik here, i rewrote it with mine, it has coyote stuff and hold to jump!

function scr_movement(){
    var _subPixel = 0.5
	if place_meeting(x+xspd,y,obj_collision)
	{
		var _pixelCheck = _subPixel * sign(xspd);
            
            while !place_meeting(x + _pixelCheck, y, obj_collision)
            {
                x+= _pixelCheck;
            }
            
            //set xspd to zero to "collide"
            xspd = 0;
	} 
    
    
	//x Movement     viktorery: omg, there was around so much x += xspd
	x += xspd
	

    

    // gravity and terminal speed only in free state
    yspd += grav;
    if yspd > term_vel {yspd = term_vel};
	
    var _subPixel = 0.5
	if place_meeting(x,y+yspd,obj_collision)
	{
		var _pixelCheck = _subPixel * sign(yspd); 
        
            while !place_meeting(x, y + _pixelCheck, obj_collision)
            {
                y += _subPixel * sign(yspd);
            };
        
            if yspd < 0
            {
                jumpHoldTimer = 0;
            }

            yspd = 0;
	}
		
    y += yspd;    

    on_ground = yspd >= 0 and place_meeting( x, y+1, obj_collision)
	
	
	
}

function scr_state_attack()
{
    
    instance_create_depth(x,y, -9999, obj_slash)
    
}

