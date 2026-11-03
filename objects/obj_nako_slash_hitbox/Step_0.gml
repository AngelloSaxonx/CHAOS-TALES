///@description Knockback and Hitbox tracking 
//[Vibecode] Dslist - it creates one every frame  
var list = ds_list_create(); //Does it create one and detroy one every active frame, oh...  
var inst = noone
var player_inst = noone 
var _num = instance_place_list(x, y, obj_hurtbox_player, list, false); //is this an aoe hitscan? 

if (_num > 0) //if we hit more than one thing; but it doesn't check who yet 
{
    for (var i = 0; i < _num; ++i) //cycle through *every* target we hit... one at a time
    {
		var check_inst = list[| i]
        if (check_inst.from != id) //if the target hit is not the creator enemy 
		{
		inst = check_inst
		}
		else
		{
		player_inst = check_inst //[Vibecode] *this entire knockback section is potato*
		}
    }
}
else
{
	instance_destroy()
}

ds_list_clear(list) //lack of cleanup step is gonna cause performance issues 

if (inst != noone) && (inst.hittable == true)  && (hasHit == 0) and alarm[0] < 19 //3 frames fewer 
{
	var _face = image_xscale //kinda clever, -1 is the direction on the x-axis 
	var _power = knock_Dis //[Vibecode] why is this defined twice 
	with (inst) //
	{
		if (object_index == obj_flower) //i assume this is the player? 
		{
			Health_bar--; //also makes sense to handle this on flower
			sprite_index = spr_flower_hurt; //shouldnt this be handled on flower? 
			face = -_face; //forces the target to switch directions it is facing? 
			knockY = -_power //vertical knock is twice as far! 
			knockX = (_power/2)*_face //knocks it half the distance, flipped by direction 
		}
		else{instance_destroy()} //hard-coded to remove the hitbox after dealing damage?
	}
	
	hasHit = 1; //[Fix] boolean real number shenanigans 
	alarm[1] = 60 
}

#region Functional Code 
//check the duration timer before acting 
if (alarm[0] < duration/2) {
	image_alpha -= 0.0075 //fade out  
	image_yscale -= clamp(0.01,0.75,1.10) //narrow the sprite slightly 
}
if (image_alpha <= 0) //failsafe remove at low opacity  
instance_destroy();

//Res' Hitbox Tracking - WIP 
//not entirely the most efficient but it works as intended 
if (creatorId != undefined) { 
if (creatorId.image_xscale > 0) //if they are facing right 
	x = creatorId.x + creatorId.sprite_width/5 	//add to x offset 
if (creatorId.image_xscale < 0) //negative value means mirrored 
	x = creatorId.x - creatorId.sprite_width/5  //subtract x offset 
//position the hitbox 
if creatorId.sprite_index = spr_nako_dash_swing_2
	y = creatorId.y - creatorId.sprite_height/5 
if creatorId.sprite_index = spr_nako_dash_swing_4 
	y = creatorId.y + creatorId.sprite_height/5 
} //end creatorId actually existing 	
else { //if they do not exist because Nako was defeated  
x += xspd //allows it to move naturally with momentum 
}	

#endregion 