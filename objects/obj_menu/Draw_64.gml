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
	draw_text(x,y,select_character+scroll_y)
	
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
	x - 10,
	y+boarderY,
	5,9,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x + 100,
	y+boarderY,
	6,9,0,c_white,0.5
	)
	
	////Char_list
	#region
	//hide the icon and text when they're outside of boarder using surface
	//create and setting
	if (!surface_exists(surf)) {
    surf = surface_create(94, 84);
	}
	surface_set_target(surf);
	//setting the invis black cover outside of boarder so they're stay hidden
	draw_clear_alpha(c_black,0)
	//now draw icons and texts
	for (var i = 0; i < array_length(char_list); ++i) {
		var select_color = c_white
		if (select_character = i)
		{select_color = c_red}
		
		scr_menu_type(x,y+(scroll_y*22)+(step*i),char_icon[i],string_length(char_icon),0,select_color,select_color)
	}
	//Reset the surface back to the main application surface
	surface_reset_target();
	//then draw the invis cover
	draw_surface(surf,x-157,y-77)
	#endregion
	
	////Char_stats
	scr_menu_type(x,y,char_stats[select_character],string_length(char_stats),1,c_white,c_white)
	////Char_2_stats
	scr_menu_type(x,y,char_2_stats[select_character],string_length(char_2_stats),2,c_white,c_white)
	////Char_desc
	scr_menu_type(x,y,char_desc[select_character],string_length(char_desc),3,c_white,c_white)
}