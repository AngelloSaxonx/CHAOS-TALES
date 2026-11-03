#region
randomise() //wby are we generating a new seed on create? 
path = path_add();

//[Reconsider] Progress 95% - needs update but behaves properly now :D 
RealTarget = obj_flower
Target = RealTarget //[Vibecode] - works - redundant nonsense variables 
TargetX = Target.x
TargetY = Target.y
TargetX_offset = 0;
TargetY_offset = 0;
Detect_Timer = 0
Choose_Timer = 0;

spd = 1 //Fixed most of this but @Resonance22 can update 
max_spd = spd
jump_spd = 6
xspd = 0;
yspd = 0;
should_jump = false

grav = .275;
term_vel = 4;
looking_range = 60

ground_y = bbox_bottom

jump_frame = jump_spd/grav
jump_range_limit = ( (floor(jump_frame)/2)*( (jump_spd-grav) + (jump_spd- (floor(jump_frame)*grav) ) ) ) 
fall_detect = room_height/3;
stop_chase = 0;
#endregion

#region Dash and Attack 
//ask Resonance22 

nakoPhase = 3 //switch statement, ill finish it  
nakoResetMax = 4
stopMovement = false 
attackInProgress = false 

dashDirection = point_direction(x,y,TargetX,TargetY)
dashDuration = 0 //makes the dash happen if > 0 
dashLength = 16 //distance 
dashTime = 8 //frames 
dashSpeed = dashLength/dashTime //sets the speed of the dash