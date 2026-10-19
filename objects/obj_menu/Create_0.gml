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
lv = []
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

for (var i = 0; i < array_length(char_list); ++i) {
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
			array_push(char_desc,
			"LV" + string(lv[i]) + " Nakolyn" + 
			"\n\n" + string(desc[i])
			)
		}
		break;
	}
}
char_icon_progress = string_length(char_icon)
char_stats_progress = string_length(char_stats)
char_desc_progress = string_length(char_desc)

/*
//object = obj_flower;
//char_list = 0;
//char_list_progress = 0;
lv = 1;
xp = 0;
xp_max = 100;
hp = 10;
hp_max = 10;
sp = 5;
sp_max = 5;
atk = 0;
def = 0;
magic  = 0;
stat_3 = 0;
stat_4 = 0;
stat_5 = 0;
//Flower
global.flowerlv = 1;
global.flowerxp = 0;
global.flowerxp_max = 100;
global.flowerhp = 50;
global.flowerhp = 50;
global.flowersp = 5;
global.flowersp_max = 5;
global.floweratk = 4;
global.flowerdef = 2;
global.flowermagic = 2;
global.flowerstat3 = 0;
global.flowerstat4 = 0;
global.flowerstat5 = 0;

scr_partymemb = ["Flower","Nako"];*/
icon_sprite = [ICON_STATS,ICON_ITEMS,ICON_EQUIP,ICON_MAP,ICON_JOURNAL,ICON_CONFIG]

space = 20;
Xoffset = 2
Yoffset = 12
//hp_lenght = array_create(hp_max,hp)
//sp_lenght = array_create(sp_max,sp)