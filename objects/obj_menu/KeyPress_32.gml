if (room != rm_titlescreen)
{
	array_push(char_list,choose(obj_flower,obj_nako_party))
	for (var i = array_length(char_list)-1; i < array_length(char_list); ++i) {
		switch (char_list[i])
		{
			case obj_flower :
			{
				array_push(lv,1)
				array_push(hp,10)
				array_push(hp_max,10)
				array_push(sp,5)
				array_push(sp_max,5)
				array_push(atk,4)
				array_push(def,2)
				array_push(magic,2)
				array_push(stat4,0)
				array_push(stat5,0)
				array_push(desc,"A random dude")
			
				array_push(char_icon,"@flower@Flower")
				array_push(char_stats,
				"Atk: " + string(atk[i]) + "\n" +
				"Def: " + string(def[i]) + "\n" +
				"Mag: " + string(magic[i])
				)
				array_push(char_2_stats,
				"Hp: " + string(hp[i]) + "/" + string(hp_max[i]) + "\n" +
				"Sp: " + string(sp[i]) + "/" + string(sp_max[i]) + "\n" +
				"Lvl: " + string(lv[i])
				)
				array_push(char_desc,
				"LV" + string(lv[i]) + " Flower" +
				"\n\n" + string(desc[i])
				)
			}
			break;
			case obj_nako_party :
			{
				array_push(lv,1)
				array_push(hp,20)
				array_push(hp_max,20)
				array_push(sp,0)
				array_push(sp_max,5)
				array_push(atk,2)
				array_push(def,5)
				array_push(magic,0)
				array_push(stat4,0)
				array_push(stat5,0)
				array_push(desc,"A random knight")
			
				array_push(char_icon,"@nako@Nakolyn")
				array_push(char_stats,
				"Atk: " + string(atk[i]) + "\n" +
				"Def: " + string(def[i]) + "\n" +
				"Mag: " + string(magic[i])
				)
				array_push(char_2_stats,
				"Hp: " + string(hp[i]) + "/" + string(hp_max[i]) + "\n" +
				"Sp: " + string(sp[i]) + "/" + string(sp_max[i]) + "\n" +
				"Lvl: " + string(lv[i])
				)
				array_push(char_desc,
				"LV" + string(lv[i]) + " Nakolyn" +
				"\n\n" + string(desc[i])
				)
			}
			break;
		}
	}
}