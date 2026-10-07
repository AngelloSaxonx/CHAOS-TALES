///@description What does this do? 
//*insert behavior description here* 

jumping = false;

path = path_add() //what's the path for? 
image_moving = 0; //does not need be a variable; why is this not image_speed? 
attack_spr[0] = spr_nako_swing_final
attack_spr[1] = spr_nako_swing_body
attack_spr[2] = spr_nako_swing_left_arm
attack_spr[3] = spr_nako_swing_right_arm

hitbox_Xsize = round((bbox_right-bbox_left)) //i've never seen this rounded, we have a collision mask  

know = 0;  

#region Movement Variables 
xspd = 0; //why not hspeed? i guess it's precise 
yspd = 0; //why not vspeed? 
jspd = 6 //jum speed
spd = 1 //presumably this is for a vector compoment hmm 
grav = .275 //gravity that probably pulls vspeed down to a platform 
term_vel = 4; //the maximum fall speed, or terminal velocity  
max_spd = spd //what their speed resets to, i assume  
should_jump = 0; //should be a boolean (true/false) or, unclear what this is for 
ground_y = bbox_bottom //i dont know if we need to hard code the floor, or their feet  
ground_y1 = bbox_bottom 
jump_rangeX = 32 //if the jump is capped by Speed, why do we need a range? unless it's for player range? 
jump_rangeX2 = 32 //i believe this is the other direction? why both 
jump_rangeY = 63 //is there a reason it is 1 pixel short of 64? 
jump_range_limitY = 0; 
jump_range_detectY = 0; //
pit_rangeX = 14+(spd*6) //what an oddly specific formula?

#endregion 

#region attackingVariables 
target = obj_flower //if there's only one Player to target, why hard-code it? hmm 
targetX = target.x //isn't this always obj_flower.x 
targetY = target.y
target_offsetX = 0 
target_offsetY = 0

attacking= false //i assume in-progress 
from = 0 //unclear what this is for 
cooldown = 60; //oh woah this is initialized at 0? so it can attackingimmediately from 0. let's make it 60
#endregion 

#region Dash Variables - ask @Resonance22
dashDir = point_direction(x,y,targetX,targetY) //default dash direction
dashTime = 0 //in frames; start it by setting dashTime > 0 
dashLength = 64 //distance traveled 
dashTimeReset = 18 //the typical duration it takes to travel X distance 
dashSpd = dashLength/dashTimeReset //how quickly it dashes depends on the duration  
#endregion Dash 
