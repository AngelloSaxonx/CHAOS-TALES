draw_self() //draw nako's sprite 

//why are we drawing shapes? 
draw_circle(x,y,100,true)
draw_rectangle(TargetX-(sprite_width/2),TargetY-(sprite_height/3),TargetX+(sprite_width/2),TargetY-1+(sprite_height/2),true)

draw_line(x,y,TargetX,TargetY) //i assume for targeting 

draw_text(x,y,point_distance(x,y,TargetX,TargetY))

draw_text(x,y+10,abs(dashLength + sprite_width * 5))

draw_text(x,y-10,nakoPhase)