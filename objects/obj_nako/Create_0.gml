#region
path = path_add();

Target = obj_flower
TargetX = Target.x
TargetY = Target.y

spd = 1
max_spd = spd
jump_spd = 6
xspd = 0;
yspd = 0;
should_jump = false

grav = .275;
term_vel = 4;
lookig_range = 60

ground_y = bbox_bottom

jump_frame = jump_spd/grav
jump_range_limit = ( (floor(jump_frame)/2)*( (jump_spd-grav) + (jump_spd- (floor(jump_frame)*grav) ) ) ) 
fall_detect = room_height/3;
stop_chase = 0;
#endregion