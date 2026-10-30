if (global.paused && surface_exists(pause_surface))
{
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
	var _text = "Press "+ chr(keys.menu) + " or " + string(gamepad.menu) +" to resume"
	scr_pause_text(x,y+115,_text,string_length(_text),1,c_white,c_white)
	
}


