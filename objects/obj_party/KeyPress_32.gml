if (room != rm_titlescreen)
{
	array_push(char_list,obj_flower)
	for (var i = array_length(char_list)-1; i < array_length(char_list); ++i) {
		switch (char_list[i])
		{
			case obj_flower :
			{
				array_push(hp,10)
				array_push(hp_max,10)
				array_push(sp,5)
				array_push(sp_max,5)
				array_push(atk,4)
				array_push(def,2)
				array_push(magic,2)
				array_push(stat4,0)
				array_push(stat5,0)
			
				array_push(char_icon,"@flower@Flower")
				array_push(char_stats,
				"Atk: " + string(atk[i]) + "\n" +
				"Def: " + string(def[i]) + "\n" +
				"Mag: " + string(magic[i])
				)
			}
			break;
			case obj_nako_party :
			{
				array_push(hp,20)
				array_push(hp_max,20)
				array_push(sp,0)
				array_push(sp_max,0)
				array_push(atk,2)
				array_push(def,5)
				array_push(magic,0)
				array_push(stat4,0)
				array_push(stat5,0)
			
				array_push(char_icon,"@nako@Nako")
				array_push(char_stats,
				"Atk: " + string(atk[i]) + "\n" +
				"Def: " + string(def[i]) + "\n" +
				"Mag: " + string(magic[i])
				)
			}
			break;
		}
	}
	char_icon_progress = string_length(char_icon)
	char_stats_progress = string_length(char_stats)
}