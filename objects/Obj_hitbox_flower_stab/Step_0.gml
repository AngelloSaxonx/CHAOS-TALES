//floriel hitbox stab
//[Vibecode] [Refactor] 
//@Resonance22: I can fix this... but wow.... 
var list = ds_list_create();
var inst = noone
var player_inst = noone
var _num = instance_place_list(x, y, obj_hurtbox_player, list, false);

if (_num > 0)
{
    for (var i = 0; i < _num; ++i)
    {
		var check_inst = list[| i]
        if (check_inst.from != id)
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

ds_list_clear(list) //yes yes call a ds_list every frame and then remove it :perfect: 

if (inst != noone) && (inst.hittable == true)  && (hasHit == 0)
{
	var _face = image_xscale
	var _power = knock_Dis
	with(inst)
	{
		if (object_index == obj_nako)
		{
			Health_bar--;
			sprite_index = spr_nakoling_hurt;
			image_xscale = -sign(_face);
			knockY = -_power
			knockX = (_power/2)*_face
		}
		else{instance_destroy()}
	}
	hasHit = 1;
	alarm[1] = 60
}


if (player_inst != noone)
&& (player_inst.sprite_index == spr_flower_ledge_1 || player_inst.sprite_index == spr_flower_round)
{
	instance_destroy()
}

#region Sane Code 
//Fixing the Damage Hitbox - this code is fine 
//morph the sprite so it is easier to match Floriel's Attack frames 
if (alarm[0] > duration/2) {
image_xscale += clamp(0.01,1.0,1.25) //extend outward like a dagger! makes it safe to use 
image_yscale += clamp(0.005,1.0,1.10) 
}	
else {
image_xscale -= clamp(0.01,0.90,1.20) //return to normal 
image_yscale -= clamp(0.005,1.00,1.10) 
}	
#endregion 