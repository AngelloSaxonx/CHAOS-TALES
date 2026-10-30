if place_meeting(x,y,obj_flower)
{
	with (obj_menu)
	{
		total_keys += 1
		
		money_stats = "P: " + string(total_pounds) + "   " +
		"K: " + string(total_keys) + "\n" +
		"FP: " + string(total_flowerps) + "   " +
		"BP: " + string(total_boneps)
	}
	instance_destroy()
}