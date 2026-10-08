function Pathing(){
	
	if mp_grid_path(Obj_grid.grid,path,x,y,TargetX,TargetY,true) // used a path with MP grid
	{
	
		var xx = path_get_point_x(path,1) // the X pos of the path
		var yy = path_get_point_y(path,1) // the Y pos of the path

		if (x < xx)
		{xspd = 1;} // <<< Left
	
		else if (x > xx)
		{xspd = -1;} // <<< Right
	
		else
		{xspd = 0;} // <<< is reached his goal
	
		var dividing = 1
		var front_detect_coll = collision_rectangle(x, bbox_top-32, x+ (xspd*front_coll) , bbox_bottom-1,obj_collision,true,true)
		if (front_detect_coll) // if the wall gap is 1 or 2 block higher, i want to use him maximize jump.
		{dividing = 8} // so i decided 8
	
		/// Jumping ///
		if (y-2 > yy)
		{
			// 1. jumping if he can jump enough thought the wall
		
			var wall_block = collision_rectangle(
		
			bbox_left-1+(jump_frame*(xspd*spd)) //<<< X range (using Jump Frames and speed to calculate Range) (also added -1 for checking wall even standing still)
			,(ground_y-1)-jump_range_limitY, //<<< checking the roof and wall
			bbox_right+1+(jump_frame*(xspd*spd)), //<<< X range (using Jump Frames and speed to calculate Range) (also added -1 for checking wall even standing still)
			ground_y-1, //<<< ground (-1 for not checking floor)
		
			obj_collision,true,true) 
		
			if (
			wall_block // this'll check the wall in front of him and check if he can jump enough too ,  i'd give him a little peeky to check the wall near him so he could jump evenn xspd is 0;
		
			&& (ground_y-1)-jump_range_limitY < wall_block.bbox_top  /// checking if the wall was not too tall to jump
			)
		
			|| 
		
			//2. jumping in max distance for gaps
		
			!collision_rectangle(
		
			bbox_left+(xspd*(jump_frame/dividing)), // dividing with determine that he gonna need to maximize jump
			bbox_bottom, // Y value
			bbox_right+(xspd*(jump_frame/dividing)), // dividing with determine that he gonna need to maximize jump
			ground_y_front+1, // ground
		
			obj_collision,true,true )
		
			{
			should_jump = true // it mean it can jump
			}
		}
		else if (y+2 < yy)
		{
			if !collision_rectangle(x,bbox_bottom,x + (xspd*96), ground_y_front+1, obj_collision,true,true)
			// checking if there's a floor to land before he fall
			{
				should_jump = true // it mean it can jump
			}
		}
		else
		{
			// 1. jumping if he can jump enough thought the wall
		
			var wall_block = collision_rectangle(
		
			bbox_left-1+(jump_frame*(xspd*spd)) //<<< X range (using Jump Frames and speed to calculate Range) (also added -1 for checking wall even standing still)
			,(ground_y-1)-jump_range_limitY, // <<< checking the roof and wall
			bbox_right+1+(jump_frame*(xspd*spd)), //<<< X range (using Jump Frames and speed to calculate Range) (also added -1 for checking wall even standing still)
			ground_y-1, // <<< ground (-1 for not checking floor)
		
			obj_collision,true,true) 
		
			if (
			wall_block // this'll check the wall in front of him and check if he can jump enough too ,  i'd give him a little peeky to check the wall near him so he could jump evenn xspd is 0;
		
			&& (ground_y-1)-jump_range_limitY < wall_block.bbox_top  /// checking if the wall was not too tall to jump
			)
		
			|| 
		
			//2. jumping in max distance for gaps
		
			!collision_rectangle(
		
			bbox_left+(xspd*(jump_frame/dividing)), // dividing with determine that he gonna need to maximize jump
			bbox_bottom, // Y value
			bbox_right+(xspd*(jump_frame/dividing)), // dividing with determine that he gonna need to maximize jump
			ground_y_front+1, // ground
		
			obj_collision,true,true )
		
			{
				should_jump = true // it mean it can jump
			}
		}
	
	
	}

}