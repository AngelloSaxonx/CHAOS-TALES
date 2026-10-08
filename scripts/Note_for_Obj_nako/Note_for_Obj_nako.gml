function Note_for_Obj_nako()
{

//////////////////////////////  Create


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




///////////////////////////////     Step

if collision_circle(x,y,92,target, true, true)
{jumping = true}
else
{jumping = false}

//  Pathing & Finding & Movement //
if (jumping != true)
{
	///// under maintenance /////
	
	#region

var offsetY = 0;
if instance_place(x,y+1,obj_collision) 
{offsetY = 1;}

var offsetTargetY = 0;
if instance_place(targetX,targetY+2,obj_collision)
{offsetTargetY = 2;}

//this might cause performance issues 
for (var i = 0; i < room_height; ++i) {
	ground_y = round((bbox_bottom+i)/20)*20
	if (collision_line(bbox_left,ground_y,bbox_right,ground_y,obj_collision,0,0))
	{
		break;
	}
}

//this will only work if every enemy is this size o_o' 
for (var j = 0; j < room_height; ++j) {
	var xx = xspd*20
	var xx2 = xspd*30
	
	ground_y1 = round((bbox_bottom+j)/20)*20 //why divide and times by 20? 
	
	var detect_coll = collision_line(x+(xspd*20),ground_y1-10,x+(xspd*30),ground_y1-10,obj_collision,0,0)
	if (detect_coll != noone) && (detect_coll.bbox_top < bbox_bottom+2)
	{
		xx = 0
		xx2 = 0
	}
	
	if (collision_line(x+xx,ground_y1,x+xx2,ground_y1,obj_collision,0,0))
	or (collision_line(x+xx,ground_y1,x+xx2,ground_y1,obj_void,0,0))
	{
		break;
	}
}

for (var k = 0; k <= jump_rangeY; ++k) {
	jump_range_limitY = k
	if (collision_rectangle(bbox_left,ground_y-jump_range_limitY,bbox_right,ground_y-1,obj_collision,true,0))
	{
		break;
	}
}

//this could be a clamp 
for (var l = 0; l <= jump_rangeY; ++l) {
	jump_range_detectY = l
	if (collision_rectangle(0,ground_y-jump_range_detectY,room_width,ground_y-1,obj_collision,true,0))
	{
		break;
	}
}

var list2 = ds_list_create() //no clean up event? 
var colly = noone //likely stands for collision_y 
var disting = 999999

var coll2 = collision_rectangle_list(0,ground_y-(jump_range_detectY+1),room_width,ground_y-1,obj_collision,true,0,list2,false)
if (coll2 > 0)
{
	for (var i = 0; i < coll2; ++i)
	{
		var inst2 = list2[| i];
		
		var _dist = point_distance(x, ground_y, clamp(x,inst2.bbox_left,inst2.bbox_right), inst2.y);
		
		if (_dist < disting) {
			disting = _dist;
			colly = inst2
		}
	}
}

if (ground_y - jump_rangeY > target.bbox_bottom)
{
	if (colly)
	{
		if x < colly.bbox_left+((colly.image_xscale*20)/2)
		{
		targetX = colly.bbox_left+10
		}
		else
		{
		targetX = colly.bbox_right-10
		}
		targetY = colly.bbox_top-10
	}
	else if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_collision,false,true)
	{
		targetX = target.x + target_offsetX
		targetY = target.y + target_offsetY
	}
}
else //if (x == targetX && y == targetY)
{
	targetX = target.x + target_offsetX
	targetY = target.y + target_offsetY
}

ds_list_destroy(list2)

if mp_grid_path(Obj_grid.grid,path,x,y-offsetY,targetX,targetY-offsetTargetY,true)
{
	var crl_length = 1;
	path_start(path,10,path_action_stop,true)
	path_end()
	
	var xx = path_get_point_x(path,crl_length)
	var yy = path_get_point_y(path,crl_length)
	
	if (x > xx)
	{xspd = -1}
	else if (x < xx)
	{xspd = 1}
	else if !(collision_rectangle(bbox_left-(xspd*pit_rangeX),ground_y1-jump_range_limitY,bbox_right-(xspd*pit_rangeX),ground_y1,obj_collision,false,true) &&
	!collision_rectangle(bbox_left+(xspd*pit_rangeX),ground_y1-jump_range_limitY,bbox_right+(xspd*pit_rangeX),ground_y1,obj_collision,false,true) 
	&& (ground_y1 > target.bbox_bottom-1))
	{xspd = 0;}
	
	if instance_place(x,y+1+yspd,obj_collision)
	{
		var crlY = 9
		if (ground_y > target.bbox_bottom-2)
		{
			crlY = 0;
		}
		
		if (y-10 > yy+crlY)
		{
			text = 1
			if (collision_rectangle(bbox_left-(3-(abs(xspd)*3))+(xspd*jump_rangeX),ground_y-jump_range_limitY+1,bbox_right+(3-(abs(xspd)*3))+(xspd*jump_rangeX),ground_y-1,obj_collision,false,true)
			&& !collision_rectangle(bbox_left,ground_y-jump_rangeY,bbox_right,ground_y-1,obj_collision,false,true))  
			|| (!collision_rectangle(bbox_left+(xspd*pit_rangeX),ground_y1,bbox_right+(xspd*pit_rangeX),ground_y1+1,obj_collision,false,true)
			&& (ground_y1 >= target.bbox_bottom-1))
			{yspd = -jspd;}
		}
		else
		{
			text = 2
			var list = ds_list_create()
			var inst = noone
			var coll = collision_line_list(x,ground_y1,x+(xspd*3000),ground_y1,obj_void,false,true,list,true)
			if (coll > 0)
			{
				for (var i = 0; i < coll; ++i)
				{
					var inst2 = list[| i];
					if (jump_rangeX2 <= inst2.image_xscale*20 && ((jump_range_limitY)/7.5) < inst2.image_xscale*jump_rangeX2)
					{inst = inst2}
				}
			}
			
			if (!collision_rectangle(bbox_left+(xspd*pit_rangeX),ground_y1-1,bbox_right+(xspd*pit_rangeX),ground_y1+1,obj_collision,false,true) && (ground_y1 >= target.bbox_bottom-1))
			|| (collision_rectangle(bbox_left-1+(xspd*jump_rangeX),ground_y-jump_range_limitY,bbox_right+1+(xspd*jump_rangeX),ground_y-1,obj_collision,false,true)
			&& (inst != noone) && (ground_y >= target.bbox_bottom))
			//
			
			{yspd = -jspd;}
		}
	}
	//text = yy
	/*if (y > yy)
	{yspd = -1}
	else if (y < yy)
	{yspd = 1}
	else
	{yspd = 0;}*/
}

if instance_place(x+(xspd*spd),y-(1-should_jump),obj_collision)
{
	xspd = 0;
	x = round(x/2)*2;
}

if instance_place(x,y+yspd,obj_collision)
{
	yspd = 0;
	if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+21+yspd,obj_collision,false,true)
	{should_jump = 1}
	else
	{
		if collision_rectangle(bbox_left,bbox_top-1+yspd,bbox_right,bbox_top,obj_collision,false,true)
		{y = ceil(y/4)*4}
		else{y = round(y/2)*2}
	}
}
else
{
	var ground_landed = 0;
	
	if !instance_place(x,y+1+(yspd/2),obj_collision)
	{
	if (yspd < term_vel)
	{yspd += grav}else
	{yspd = term_vel}
	}
	
	if !collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true)
	{should_jump = 0} //disables the jump
}


if (point_distance(x,y,targetX,targetY) < spd)
{
	max_spd = abs(x-targetX)
}
else
{
	max_spd = spd
}

x += (xspd*max_spd)
y += yspd

#endregion
	
	///// it was the old one still but i'mm doing new one in other project.
}

else
{
	
	
#region Dash Code 
//nothing is really labeled before so i assume this char clamps to floor elsewhere?
//Nako is able to dash at an angle currently but at half the vertical speed  
if dashTime > 0 {
dashTime-- //deduct one from counter 
xspd = lengthdir_x(dashSpd,dashDir)
yspd = lengthdir_y(dashSpd/2,dashDir)
}	
if (dashTime <= 0) and !attacking and collision_circle(x,y,92,target, true, true) {
dashTime = dashTimeReset //reset the Dash if we're not attacking 
dashDir = point_direction(x,y,targetX,targetY) 
if yspd < 0 {//if it's not negative 
sprite_index = spr_nako_dash_swing_2 //swing down 
}	
else if yspd > 0 {
sprite_index = spr_nako_dash_swing_4 //swing up 
}
}


#endregion Dash 

if instance_place(x+(xspd),y-(1-should_jump),obj_collision)
{
	xspd = 0;
	x = round(x/2)*2;
}

if instance_place(x,y+yspd,obj_collision)
{
	yspd = 0;
	if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+21+yspd,obj_collision,false,true)
	{should_jump = 1}
	else
	{
		if collision_rectangle(bbox_left,bbox_top-1+yspd,bbox_right,bbox_top,obj_collision,false,true)
		{y = ceil(y/4)*4}
		else{y = round(y/2)*2}
	}
}
else
{
	var ground_landed = 0;
	
	if !instance_place(x,y+1+(yspd/2),obj_collision)
	{
	if (yspd < term_vel)
	{yspd += grav}else
	{yspd = term_vel}
	}
	
	if !collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true)
	{should_jump = 0} //disables the jump
}

x += xspd
y += yspd
}


//auto-attack if the Player is within a 40 px circle *originating from nako's feet, fixed by request 
if collision_circle(x,y,40,target,false,true) && (from = noone) && (cooldown <= 0)
{
	attacking = true
}

var AtkX = x+(image_xscale*20)
var AtkY = bbox_bottom-10
	
if (attacking= true) && (from == noone)
{
	//var nakoSlash = 
	with (instance_create_depth(AtkX,AtkY,depth,obj_nako_slash_hitbox)) 
	{ //create a Struct that modifies the attackHitbox's variables, or default parameters 
	image_xscale = other.image_xscale //a more efficient way of doing this; copy it from the creator
	//mirrors the Slash attackingto face Nako's direction 
	}	
	//nakoSlash.image_xscale = image_xscale
	from = atk.id //had to change due to redundant variable name (used differently in scripts) 
	cooldown = 82; //nerfed from 60 frames 
}
//interesting method of removing the attack, or, actually detecting if one is not in progress 	
if (from != noone) {
	if instance_exists(from) {from.x = AtkX+xspd; from.y = AtkY+yspd; from.image_xscale = image_xscale}
	else {from = noone}
	attacking= false
}
else
{
	if (cooldown > 0) //if whatever this is has cooldown remaining  
	{cooldown--;} //decrements the cooldown 
	else{cooldown = 0} //a curious way of keeping the minimum to 0; but it works 
}

#region Nako's Sprites 

if (xspd != 0)
{
	image_xscale = sign(xspd)
	if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true))
	{
		if sprite_index != spr_nako_jump
		{image_index = 0}
		sprite_index = spr_nako_jump
		if (image_index > image_number - 1) //curious way to just remove 1 frame until it finishes 
		{image_index = image_number - 1;}
	}
	else
	{
		if sprite_index != spr_nako_walk
		{image_index = 0}
		sprite_index = spr_nako_walk
	}
}
else
{
	if (!collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+2+yspd,obj_collision,false,true))
	{
		if sprite_index != spr_nako_jump
		{image_index = 0}
		sprite_index = spr_nako_jump
		if (image_index > image_number - 1)
		{image_index = image_number - 1;}
	}
	else
	{
		if sprite_index != spr_nako
		{image_index = 0}
		sprite_index = spr_nako
	}
}

////////////   Draw



if (from != noone)
{
	image_moving += sprite_get_speed(attack_spr[0])/60
	draw_sprite_part_ext(sprite_index, image_index,0,34,40,6,x-(20*image_xscale),y-6,image_xscale, image_yscale, image_blend, image_alpha)
	draw_sprite_part_ext(attack_spr[1], image_moving,0,0,40,34,x-(20*image_xscale),y-40,image_xscale, image_yscale, image_blend, image_alpha)
	draw_sprite_ext(attack_spr[3], image_index+4,x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	draw_sprite_ext(attack_spr[2], image_moving,x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
}
else
{
	draw_self()
}

if (from == noone)
{
	image_moving = 0;
}


}