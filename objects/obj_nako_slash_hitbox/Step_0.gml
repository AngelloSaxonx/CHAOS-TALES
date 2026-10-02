var list = ds_list_create(); //Does it create one and detroy one every active frame, oh...  
var inst = noone
var player_inst = noone 
var _num = instance_place_list(x, y, obj_hurtbox, list, false); //is this an aoe hitscan? 

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
		player_inst = check_inst
		}
    }
}
else
{
	instance_destroy()
}

ds_list_clear(list) //no cleanup step is gonna cause performance issues 

if (inst != noone) && (inst.hittable == true)  && (hasHit == 0) and alarm[0] < 19 //3 frames fewer 
{
	var _face = image_xscale //kinda clever, -1 is the direction on the x-axis 
	var _power = knock_Dis //why is this defined twice 
	with(inst) //
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
	
	hasHit = 1;
	alarm[1] = 60
}