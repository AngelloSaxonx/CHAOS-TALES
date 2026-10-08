function Laser_Detection(){

	// Laser detection mechanic 
	//it's consist like this


	/*

	for (var i = 0; i < (whatever Range); ++i) <<< //the for (i) loop
	{
		[the variable you'll used to check other] = [i add y value there]+ i
		^^^ // the variable received the value
	
		if (collision function (whatever arguments you have to put for function but in y value, switch it with the variable. ) ) <<< //collision for checking a wall
		{break;} <<< //stop a loop
	}

	*/

	//collision function can be
	//instance_place(), place_meeting(),
	//but i rather use collision_rectangle() since i waana check in between the start and the end

	//as exammple

	/// Drop Length Detection ///
	// checking down to that range (room_height) until it hits a floor,
	// if it hits a floor, it's checking a floor then.
	/*
	for (var i = 0; i < room_height; ++i) //<<< the for (i) loop
	{
		ground_y = bbox_bottom+i //<<< bbox_bottom is a y value
		//^^^  the variable received the value (which is ground_y being a variable and bbox_bottom+i being a value)
	
		if (
		collision_rectangle(
	
		bbox_left, <<< //left
		ground_y, <<< //y value, switched it with the variable.
		bbox_right, <<< //right
		ground_y+1, <<< //same thing but added 1 for detect a wall
	
		obj_collision,true,true)) //<<< collision for checking a wall
	
		{break;} <<< //stop a loop
	}
	*/

	//it's useful for checking a first wall it see, like a laser


	//i used it for Checking

	/// Drop Length Detection ///
	// checking down to that range (room_height) until it hits a floor,
	// if it hits a floor, it's checking a floor then.
	for (var i = 0; i < room_height; ++i) //<<< the for (i) loop
	{
		ground_y = bbox_bottom+i //<<< bbox_bottom is a y value
		//^^^  the variable received the value (which is ground_y being a variable and bbox_bottom+i being a value)
		if (
		collision_rectangle(
	
		bbox_left,//left
		ground_y,//y value, switched it with the variable.
		bbox_right,//right
		ground_y+1,//same thing but added 1 for detect a wall
	
		obj_collision,true,true)) //<<< collision for checking a wall
		{break;} //<<< stop a loop
	}


	/// Drop Length Detection to the front ///
	// Same as previous but this time checking if there a floor
	for (var j = 0; j < fall_detect; ++j)//<<< the for (i) loop
	{
		ground_y_front = bbox_bottom+j //<<< bbox_bottom is a y value
		//^^^  the variable received the value (which you've known it)
		if 
		(collision_rectangle(
	
		bbox_left+(xspd*sprite_width),//left but now have (xspd*sprite_width) to check further
		ground_y_front,//y value, switched it with the variable.
		bbox_right+(xspd*sprite_width),//left but now have (xspd*sprite_width) to check further
		ground_y_front+1,//same thing but added 1 for detect a wall
	
		obj_collision,true,true))//<<< collision for checking a wall
		{break;}//<<< stop a loop
	}


	/// Jump Range Limition ///
	//This time checking up to that range (jump_range_limit) until it hits a roof,
	// if it hits a roof, it's checking a roof then.
	for (var k = 0; k <= jump_range_limit; ++k) {
		jump_range_limitY = k //<<< i didn't add a y value there
		if (
		collision_rectangle(
	
		bbox_left,//left
		(ground_y-1)-jump_range_limitY, //y value, added the variable. [- was for checking up]
		bbox_right,//right
		ground_y-1,// (added ground_y -1 for not checking a floor)
	
		obj_collision,true,true))
		{break;}
	}

	/// Looking to the Front ///
	//This time checking whatever his'X go to that range (lookig_range) until it hits a wall,
	// if it hits a wall, it's checking a wall then.
	for (var l = 0; l <= lookig_range; ++l) {
		front_coll = l //<<< only l value needed
		if (
		collision_rectangle( 
		x, //Duh...
		bbox_top+1, //added +1 to not accidentally check the roof if the character is perfect fit
		x+ (xspd*front_coll) , //added the range
		bbox_bottom-1 , //added -1 tonot accidentally check the floor if the character is perfect fit
	
		obj_collision,true,true))
		{break;}
	}



}