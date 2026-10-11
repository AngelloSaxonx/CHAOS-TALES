function Detect_Range(){
	
if collision_circle(x,y,100,RealTarget,false,true)
&& !collision_line(x,y,RealTarget.x,RealTarget.y,obj_collision,false,true)
{
	Target = RealTarget
	TargetX_offset = 0;
	TargetY_offset = 0;
	Detect_Timer = 120
}
else
{
	if (Detect_Timer <= 0)
	{
		Target = id
		
		if (Choose_Timer <= 0)
		{
			Choose_Timer = 120
			TargetX_offset = choose(20,0,-20)
		}
		else
		{
			Choose_Timer--;
		}
		
		var coll = collision_rectangle(TargetX-(sprite_width/2),TargetY-(sprite_height/3),TargetX+(sprite_width/2),TargetY-1+(sprite_height/2),obj_collision,false,true)
		if (coll) && (TargetX_offset != 0)
		{
			TargetY_offset--;
		}
		else
		{
			TargetY_offset = 0;
		}
	}
	else
	{
		Detect_Timer--;
	}
}

}