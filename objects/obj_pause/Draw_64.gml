if (global.paused && surface_exists(pause_surface))
{
	var step = 22
	
	var boarderY = 10
	
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
	draw_sprite_ext(spr_textbox_classic,0,
	x - 90,
	y+boarderY - 45,
	4.5,4.5,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x - 90,
	y+boarderY + 45,
	4.5,4.5,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x,
	y+boarderY - 45,
	4.5,4.5,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x,
	y+boarderY + 45,
	4.5,4.5,0,c_white,0.5
	)
	
	draw_sprite_ext(spr_textbox_classic,0,
	x + 90,
	y+boarderY,
	4.5,9,0,c_white,0.5
	)
	
	for (var i = 0; i < array_length(text); ++i) {
		scr_menu_type(x,y+(step*i),text[i],text_progress,0,c_white,c_white)
	}
	draw_text(x,y+115,"Press F to resume")
}