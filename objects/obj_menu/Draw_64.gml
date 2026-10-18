//draw
if (room != rm_titlescreen) && (global.paused != true)
{
	// code here
	for (var i = 0; i < array_length(char_list); ++i) {
		draw_text(Xoffset * space + 10 +(i * 60), Yoffset*2, + string(hp[i]) + "/" + string( hp_max[i]))
		draw_text(Xoffset * space + 10 +(i * 60), Yoffset*4, + string(sp[i]) + "/" + string( sp_max[i]))
	}
}

if (global.paused == true)
{
	var step = 22
	
	var boarderY = 10
	
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
	for (var j = 0; j < array_length(icon_sprite); ++j) {
		draw_sprite(icon_sprite[j],0,x-115+(j*40),y-110)
	}
	
	draw_sprite_ext(spr_textbox_classic,0,
	x - 110,
	y+boarderY - 45,
	5,4.5,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x - 110,
	y+boarderY + 45,
	5,4.5,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x - 5,
	y+boarderY,
	5.5,9,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x + 105,
	y+boarderY,
	5.5,9,0,c_white,0.5
	)
	
	for (var i = 0; i < array_length(char_list); ++i) {
		var select_color = c_white
		if (select_character = i)
		{select_color = c_red}
		scr_menu_type(x - 25,y+(step*i),char_icon[i],char_icon_progress,0,select_color,select_color)
	}
	
	scr_menu_type(x - 25,y,char_stats[select_character],char_stats_progress,1,c_white,c_white)
	
	scr_menu_type(x + 180,y-90,char_desc[select_character],char_desc_progress,1,c_white,c_white)
}