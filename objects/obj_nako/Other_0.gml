/// @description No Clip Failsafe 
//due to some collision detection and no clip shenanigans 
//cats are the 5th state of matter - if they fit they sit 

if (point_distance(x,y,TargetX,TargetY) > 640)
instance_destroy() //remove the instance if clipped OOB and lightyears away 