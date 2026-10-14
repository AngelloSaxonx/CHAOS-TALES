if (keyboard_check_pressed(ord("F")))
{
    if (!global.paused)
    {
		if (instance_exists(obj_flower))
		{
        if (surface_exists(application_surface))
        {
            pause_surface = surface_create(
                surface_get_width(application_surface),
                surface_get_height(application_surface)
            );

            surface_copy(
                pause_surface, 0, 0,
                application_surface
            );
        }

        global.paused = true;
        instance_deactivate_all(true);
		instance_activate_object(obj_party)
		}
    }
    else
    {
        global.paused = false;
        instance_activate_all();

        if (surface_exists(pause_surface))
        {
            surface_free(pause_surface);
            pause_surface = -1;
        }
    }
}