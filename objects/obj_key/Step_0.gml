if place_meeting(x,y,obj_flower)
{
	with (obj_menu)
	{
		total_key += 1
		array_set(items_stats, 0, "Keys: " + string(total_key));
	}
	instance_destroy()
}