

// exit if no player
if !instance_exists(obj_flower){exit};
    
//get camera size
var _camWidth = camera_get_view_width(view_camera[0])
var _camHeight = camera_get_view_height(view_camera[0])


// get camera target coordinates
var _camX = obj_flower.x - _camWidth/2
var _camY = obj_flower.y - _camHeight/2

//cam to borders
_camX = clamp(_camX,0, room_width- _camWidth)
_camY = clamp(_camY,0, room_height- _camHeight)

//cam trailing
finalCamX += (_camX - finalCamX) * camTrailSpd
finalCamY += (_camY - finalCamY) * camTrailSpd

//set coordinates
camera_set_view_pos(view_camera[0], finalCamX, finalCamY)
