//create
randomise()
depth = -600
x = room_width/2
y = room_height/2
Key_word()
scroll_y = 0;
surf = -1

select_character = 0;
char_list = [obj_flower,obj_nako_party]
char_icon = []
char_desc = []

ringp = []
ringp_max = []

lv = []
xp = []
xp_max = []
hp = []
hp_max = []
sp = []
sp_max = []
atk = [];
def = [];
magic  = [];
stat4 = [];
stat5 = [];
desc = [];

char_stats = []
char_2_stats = []

array_push(ringp,0)
array_push(ringp_max,0)

for (var i = 0; i < array_length(char_list); ++i) {
	switch (char_list[i])
	{
		case obj_flower :
		{
			array_push(lv,1)
			array_push(xp,0)
			array_push(xp_max,100)
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
			"Lv: " + string(lv[i]) + "\n" +
			"Xp: " + string(xp[i]) + "\n" +
			"Hp: " + string(hp[i]) + "/" + string(hp_max[i]) + "\n" +
			"Sp: " + string(sp[i]) + "/" + string(sp_max[i]) + "\n"
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
			array_push(xp,0)
			array_push(xp_max,100)
			array_push(hp,20)
			array_push(hp_max,20)
			array_push(sp,5)
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
			"Lv: " + string(lv[i]) + "\n" +
			"Xp: " + string(xp[i]) + "\n" +
			"Hp: " + string(hp[i]) + "/" + string(hp_max[i]) + "\n" +
			"Sp: " + string(sp[i]) + "/" + string(sp_max[i]) + "\n"
			)
			array_push(char_desc,
			"LV" + string(lv[i]) + " Nakolyn" + 
			"\n\n" + string(desc[i])
			)
		}
		break;
	}
}


icon_sprite = [ICON_STATS,ICON_ITEMS,ICON_EQUIP,ICON_MAP,ICON_JOURNAL,ICON_CONFIG]

space = 20;
Xoffset = 2
Yoffset = 12
