function scr_party(_obj,_lv,_xp,_xp_max,_hp,_hp_max,_sp,_sp_max,_atk,_def,_stat_3,_stat_4,_stat_5) constructor
{
	
	obj_party.lv = _lv
	obj_party.xp = _xp;
	obj_party.xp_max = _xp_max;
	obj_party.hp = _hp;
	obj_party.hp_max = _hp_max;
	obj_party.sp = _sp;
	obj_party.sp_max = _sp_max;
	obj_party.atk = _atk;
	obj_party.def = _def;
	obj_party.stat_3 = _stat_3;
	obj_party.stat_4 = _stat_4;
	obj_party.stat_5 = _stat_5;
	
}

function scr_partymemb(_party_id)
{
	switch(_party_id)
	{
		case "Flower":
		scr_party(obj_flower,global.flowerlv,global.flowerxp,global.flowerxp_max,global.flowerhp,global.flowerhp_max,global.flowersp,global.flowersp_max,global.floweratk,global.flowerdef,global.flowerstat3,global.flowerstat4,global.flowerstat5)
		break;
	}
}