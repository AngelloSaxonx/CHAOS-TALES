function Finding(){

	if (Target.y < ground_y-jump_range_limitY) && (Target.y < y)
	//if the target is up there but in the jumpable range
	{
		// creating nearest inst with collision list (gml manunl style)
		var _list = ds_list_create();
		var coll = noone
		var dist = 99999
		var _num = collision_rectangle_list(0,ground_y-1-(jump_range_limit-(sprite_height/2)),room_width,ground_y-1,obj_collision,true,true, _list, false);
		//^^^ basically entire x bound (0 to room_width) and y was the jump range+ half of your hitbox
		if (_num > 0)// detected
		{
			for (var i = 0; i < _num; ++i)// filter it
			{
			    var close_obj = _list[| i];// put it in list
				//now the close_obj isn't one now. it added up whenever detected another one
				var close_dist = point_distance(x,y,clamp(x,close_obj.bbox_left,close_obj.bbox_right),close_obj.y+10) // now make them a distance value
				if (close_dist < dist) //close_dist was less because of course (var dist = 99999)
				{
				dist = close_dist // checking less by less until the shortest one last 
				coll = close_obj // shortest mean nearest, making coll get a nearest inst
				}
			}
		}
		ds_list_destroy(_list);// and no, it doesn't hurt as long as this code exist
		
		// same things but
		var _list5 = ds_list_create();
		var coll5 = noone
		var dist5 = 99999
		var _num5 = collision_rectangle_list(bbox_left,(ground_y-1)-jump_range_limit,bbox_right,bbox_bottom-1, obj_collision,true,true, _list5, false);
		//^^^ checking the floor above him
		if (_num5 > 0)
		{
			for (var i = 0; i < _num5; ++i)
			{
			    var close_obj = _list5[| i];
				var close_dist = point_distance(x,y,clamp(x,close_obj.bbox_left,close_obj.bbox_right),close_obj.y+10)
				if (close_dist < dist5)
				{
				dist5 = close_dist
				coll5 = close_obj
				}
			}
		}
		ds_list_destroy(_list5);
		
		if (coll != noone)//if it found nearest inst
		{
			if (collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1,obj_collision,true,true))// if on floor
			{
				if ((coll5 == noone) //if there's not a roof above him
				|| (coll5 != noone && //if there's a roof above him and try to jump
				!collision_rectangle(clamp(x,coll.bbox_left,coll.bbox_right)-32,coll.bbox_top-(sprite_height+jump_spd),clamp(x,coll.bbox_left,coll.bbox_right)+32,coll.bbox_top-1,coll5,true,true)))
				//^^^ when he jump, he sometimes hit with the roof, and the gap getting was so small. so i add this so he can think about fitting in
				{
					TargetX = clamp(x,coll.bbox_left,coll.bbox_right) // as long as on top of coll
					TargetY = coll.y-32 // on top of coll
				}
				else
				{
					TargetX = Target.x // just target position
					TargetY = Target.y
				}
			}
		}
		else
		{
			TargetX = Target.x // just target position
			TargetY = Target.y
		}
	}
	else
	{
		//They're the same concepts except
		var _list2 = ds_list_create();
		var coll2 = noone
		var dist2 = 99999
		var _num2 = collision_rectangle_list(bbox_left+(xspd*sprite_width),bbox_bottom,bbox_right+(xspd*sprite_width),ground_y_front+1, obj_collision,true,true, _list2, false);
		//^^^ checking the front's nearest floor
		if (_num2 > 0)
		{
			for (var i = 0; i < _num2; ++i)
			{
			    var close_obj = _list2[| i];
				var close_dist = point_distance(x,y,clamp(x,close_obj.bbox_left,close_obj.bbox_right),close_obj.y+10)
				if (close_dist < dist2)
				{
				dist2 = close_dist
				coll2 = close_obj
				}
			}
		}
		ds_list_destroy(_list2);
	
	
		//the floor the player stand (might use with other coll_list inst)
		var land_coll = collision_rectangle(bbox_left,bbox_bottom,bbox_right,ground_y+1,obj_collision,true,true)
	
	
		var _list3 = ds_list_create();
		var coll3 = noone
		var dist3 = 99999
		var _num3 = collision_rectangle_list(bbox_left-1,(ground_y-1)-jump_range_limitY,bbox_right+1,bbox_bottom-1, obj_collision,true,true, _list3, false);
		//^^^ checking the floor above him
		if (_num3 > 0)
		{
			for (var i = 0; i < _num3; ++i)
			{
			    var close_obj = _list3[| i];
				var close_dist = point_distance(x,y,clamp(x,close_obj.bbox_left,close_obj.bbox_right),close_obj.y+10)
				if (close_dist < dist3)
				{
				dist3 = close_dist
				coll3 = close_obj
				}
			}
		}
		ds_list_destroy(_list3);
	
		var _list4 = ds_list_create();
		var coll4 = noone
		var dist4 = 99999
		var _num4 = collision_rectangle_list(bbox_left-1,ground_y+65,bbox_right+1,(ground_y+1)+room_height, obj_collision,true,true, _list4, false);
		//^^^ checking though the first floor and second nearest floor
		if (_num4 > 0)
		{
			for (var i = 0; i < _num4; ++i)
			{
			    var close_obj = _list4[| i];
				var close_dist = point_distance(x,y,clamp(x,close_obj.bbox_left,close_obj.bbox_right),close_obj.y+10)
				if (close_dist < dist4)
				{
				dist4 = close_dist
				coll4 = close_obj
				}
			}
		}
		ds_list_destroy(_list4);
	
		if (coll3 != noone) && collision_line(x,y,Target.x,Target.y,Obj_Order_jump,false,true)
		//the floor above him detected and noted that this line^ was for pervent for doing it if the player's five feet away
		// what it's does is simply do the action when see order_jump
		{
			//if the floor above him and the floor he stand has the same cutoff of the side, go to the opposite side of the floor above him
			if (coll3.bbox_left == land_coll.bbox_left)
			{
				TargetX = coll3.bbox_right
				TargetY = coll3.y-32
			}
			//vise vresa
			if (coll3.bbox_right == land_coll.bbox_right)
			{
				TargetX = coll3.bbox_left
				TargetY = coll3.y-32
			}
		}
		else if (coll4 != noone) && (collision_rectangle(coll4.bbox_left,coll4.bbox_top-1,coll4.bbox_right,coll4.bbox_top,Target,true,true))
		//second nearest floor checked and the player is standing there
		{
			//if the floor below him and the floor he stand has the same cutoff of the side, go to the opposite side of the floor he stand
			if (coll4.bbox_left == land_coll.bbox_left)
			{
				TargetX = land_coll.bbox_right+32
			}
			//vise vresa
			if (coll4.bbox_right == land_coll.bbox_right)
			{
				TargetX = land_coll.bbox_left+32
			}
			TargetY = land_coll.y-32
		}
		else if (coll2 != noone)
		//the front's nearest floor detected
		{
			if (Target.y > ground_y) // if the target was down there
			{
				TargetX = clamp(Target.x,coll2.bbox_left,coll2.bbox_right) // he choose a side of the front's nearest floor
				TargetY = coll2.y-32
			}
			else
			{
				if collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+1+yspd,obj_collision,true,true)
				// only if he touch ground
				{TargetX = Target.x// just target position
				TargetY = Target.y}
			}
		}
		else
		{
			TargetX = Target.x// just target position
			TargetY = Target.y
		}
	}

}