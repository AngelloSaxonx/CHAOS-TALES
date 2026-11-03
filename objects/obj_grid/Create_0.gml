/// @description
//@Shenvin: Why do we have an object for a grid when the room can draw one!? 

depth = 0 //!?

grid = mp_grid_create(0,0,room_width/20,room_height/20,20,20) 
//chat is this real 
mp_grid_add_instances(grid,obj_collision,false)