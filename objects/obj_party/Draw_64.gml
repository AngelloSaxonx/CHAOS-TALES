//draw
if room != rm_titlescreen
{
	// code here
	draw_text(Xoffset * space + 20, Yoffset*2, + string(hp) + "/" + string(hp_max))
	draw_text(Xoffset * space + 20, Yoffset*4, + string(sp) + "/" + string(sp_max))
}