if (global.paused && surface_exists(pause_surface))
{
    draw_surface_stretched(
        pause_surface,
        camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]),
        camera_get_view_width(view_camera[0]),
        camera_get_view_height(view_camera[0])
    );
	
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
	draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2)
	, camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2), 
	
	"GAME PAUSED")
	
	draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])/2)
	, camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])/2) + 15, 
	"Press F to resume")
}