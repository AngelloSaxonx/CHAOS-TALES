if place_meeting(x,y,obj_flower)
{
	with (obj_menu)
	{
		total_keys += 1
		array_set(money_stats, 0, "@key@K: " + string(total_keys));
	}
	instance_destroy()
}