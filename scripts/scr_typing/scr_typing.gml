//does nobody write documentation anymore? meep 
//@Resonance22 added the Documentation / Annotation, please only touch or fix the functions themselves <

///Run Cutscene? Literally triggers a variable on obj_textbox [VibeCode] 
/// @param {string} _cutscene insert string to... return a textbox? 
function scr_start_cutscene(_cutscene)
{
	if (instance_exists(obj_textbox))
	return;
	
	var _inst = instance_create_depth( x, y, -999, obj_textbox);
	_inst.start_cutscene(_cutscene); //[Refactor] 
}
//[Vibecode] [Refactor] - what on earth is this slop .___. 
function scr_type( x, y, _text, _progress, _width, c_color1, c_color2)
{
	var _draw_x = 0;
	var _draw_y = 0;
	
	for (var _i = 1; _i <= _progress;_i++)
	{
		var _char = string_char_at(_text, _i);
		
		if (_char == "\n") //bruh? if the string is a new line!? 
		{
			_draw_x = 0; 
			_draw_y += string_height("A"); //while slop, this is not entirely dumb 
		}
		else if (_char == " ") //bruh!? if the character is a space.... no way.... i don't... believe it 
		{
			_draw_x += string_width(_char);
			
			var _word_width = 0; //word width!? word char? var ii!? 
			for (var _ii = _i + 1; _ii <= string_length(_text); _ii++)
			{
				var _word_char = string_char_at(_text, _ii)
				
				if (_word_char == "\n" || _word_char == " ")
				break;
				
				_word_width += string_width(_word_char);
				if (_draw_x + _word_width > _width)
				{
					_draw_x = 0;
					_draw_y += string_height("A");
					break;
				}
			}
		}
		else//page = current_action // draw_char = text_progress
		{
			/////Add effect
			//Variable
			var move_x = 0;
			var move_y = 0;
			var scale_x = 1;
			var scale_y = 1;
			var scale_alpha = 1;
			var text_rotate = 0;
			var current_color = c_color1; 
			//Effect
		    for (var k = 0; k < array_length(start_effect); k++) {
		        if (_i >= start_effect[k]-1 && _i <= end_effect[k]) { //[Vibecode] holy we're at _i and k now! 
		            current_color = c_color2[k];
					//Floaty
					if (effect_text[k] = 1)
					{
						float_dir[_i-1] -= 6
						move_y = dsin(float_dir[_i-1])*1
						break;
					}
					//Shaky
					else if (effect_text[k] = 2)
					{
						shake_timer[_i-1]--;
						if (shake_timer[_i-1] <= 0)
						{
							shake_timer[_i-1] = irandom(4)
							shake_dir[_i-1] = irandom_range(0,359)
						}
						if (shake_timer[_i-1] <= 2)
						{
							move_x = lengthdir_x(1,shake_dir[_i-1])
							move_y = lengthdir_y(1,shake_dir[_i-1])
						}
						break;
					}
					//Intro style
					else if (effect_text[k] = 3)
					{
						var pre_scale = 5
						if (big_small_dur[_i-1] > -(pre_scale-1)) 
						{big_small_dur[_i-1] -= (pre_scale/50)}
						
						scale_x = pre_scale + big_small_dur[_i-1]
						scale_y = pre_scale + big_small_dur[_i-1]
						scale_alpha = min(0-(big_small_dur[_i-1]/(pre_scale-1)),1)
						break;
					}
					//Fade in
					else if (effect_text[k] = 4)
					{
						var pre_scale = 0 //pre_scale.... wtf 
						if (big_small_dur[_i-1] < 1) 
						{big_small_dur[_i-1] += 0.1}
						///// shenvin thought he can mak intro style with this ai code
						//scale_x = pre_scale + big_small_dur[_i-1]
						//scale_y = pre_scale + big_small_dur[_i-1]
						scale_alpha = min(0-(big_small_dur[_i-1]/(pre_scale-1)),1)
						break;
					}
		        }
		    }
			//Mini picture
			var _used = 0
			for (var o = 0; o < array_length(key_word); ++o) { //[Vibecode] I simply cannot fathom the For Loops and we're at [o] 
				
				if string_copy(_text,_i,string_length(key_word[o])) = key_word[o]
				{
					draw_sprite(mini_sprite[o],0,x+_draw_x,y+_draw_y+3)
					_i += string_length(key_word[o]) - 1
					_draw_x += 20
					_used = 1
					break;
				}
			}
			//Text
			if (_used == 0)
			{
			draw_text_transformed_color(x-5 + _draw_x+ move_x,y+5 + _draw_y+move_y, _char, scale_x, scale_y, text_rotate ,current_color,current_color,current_color,current_color,scale_alpha);
			_draw_x += string_width(_char);
			}
		}
	}
}

//why is this another function *melts into a puddle* 
function scr_menu_type( x, y, _text, _progress, _type, c_color1, c_color2)
{
	var _draw_x = 0;
	var _draw_y = 0;
	//[Vibecode] refactor entire script. purge this entire city. call the exorcist 
	for (var _i = 1; _i <= _progress;_i++)
	{
		var _char = string_char_at(_text, _i);
		
		if (_char == "\n")
		{
			_draw_x = 0;
			_draw_y += string_height("A");
		}
		else if (_char == " ")
		{
			if (_text == char_stats[select_character])
			{
				_draw_x += (string_width(_char));
			}
			else
			{
				_draw_x += (string_width(_char)/4);
			}
			
			if (_text == char_desc[select_character])
			{
				var _word_width = 0;
				for (var _ii = _i + 1; _ii <= string_length(_text); _ii++)
				{
					var _word_char = string_char_at(_text, _ii)
				
					if (_word_char == "\n" || _word_char == " ")
					break;
				
					_word_width += string_width(_word_char);
					if (_draw_x + _word_width > 118)
					{
						_draw_x = 0;
						_draw_y += string_height("A");
						break;
					}
				}
			}
		}
		else//page = current_action // draw_char = text_progress
		{
			/////Shenvin Add effect
			//Variable Redundant Potato 
			var move_x = 0;
			var move_y = 0;
			if (_type == 0)
			{
				move_x = -148//-120;
				move_y = -103;//-60; 
			}
			else if (_type == 1)
			{
				move_x = -145;
				move_y = 30;
			}
			else if (_type == 2.5)
			{
				move_x = -45;
				move_y = -60;
			}
			else if (_type == 2)
			{
				move_x = -45;
				move_y = -(60-13);
			}
			else if (_type == 3)
			{
				move_x = 55;
				move_y = -60;
			}
			else if (_type == 4)
			{
				move_x = -45;
				move_y = 23//-60;
			}
			else
			{
				move_x = 0;
				move_y = 0;
			}
			
			var scale_x = 1;
			var scale_y = 1;
			var scale_alpha = 1;
			var text_rotate = 0;
			var current_color = c_color1; 
			//Effect
		    /*for (var k = 0; k < array_length(start_effect); k++) {
		        if (_i >= start_effect[k]-1 && _i <= end_effect[k]) {
		            current_color = c_color2[k];
					//Floaty
					if (effect_text[k] = 1)
					{
						float_dir[_i-1] -= 6
						move_y = dsin(float_dir[_i-1])*1
						break;
					}
					//Shaky
					else if (effect_text[k] = 2)
					{
						shake_timer[_i-1]--;
						if (shake_timer[_i-1] <= 0)
						{
							shake_timer[_i-1] = irandom(4)
							shake_dir[_i-1] = irandom_range(0,359)
						}
						if (shake_timer[_i-1] <= 2)
						{
							move_x = lengthdir_x(1,shake_dir[_i-1])
							move_y = lengthdir_y(1,shake_dir[_i-1])
						}
						break;
					}
					//Intro style
					else if (effect_text[k] = 3)
					{
						var pre_scale = 5
						if (big_small_dur[_i-1] > -(pre_scale-1)) 
						{big_small_dur[_i-1] -= (pre_scale/50)}
						
						scale_x = pre_scale + big_small_dur[_i-1]
						scale_y = pre_scale + big_small_dur[_i-1]
						scale_alpha = min(0-(big_small_dur[_i-1]/(pre_scale-1)),1)
						break;
					}
					//Fade in
					else if (effect_text[k] = 4)
					{
						var pre_scale = 0
						if (big_small_dur[_i-1] < 1) 
						{big_small_dur[_i-1] += 0.1}
						///// i can mak intro style with this code
						//scale_x = pre_scale + big_small_dur[_i-1]
						//scale_y = pre_scale + big_small_dur[_i-1]
						scale_alpha = min(0-(big_small_dur[_i-1]/(pre_scale-1)),1)
						break;
					}
		        }
		    }*/
			//Mini picture
			var _used = 0
			for (var o = 0; o < array_length(key_word); ++o) {
				
				if string_copy(_text,_i,string_length(key_word[o])) = key_word[o]
				{
					draw_sprite(mini_sprite[o],0,x+_draw_x+move_x,y+_draw_y+move_y-7)
					_i += string_length(key_word[o]) - 1
					_draw_x += 20
					_used = 1
					break;
				}
			}
			//Text
			if (_used == 0)
			{
			draw_text_transformed_color(x + _draw_x+ move_x,y + _draw_y+move_y, _char, scale_x, scale_y, text_rotate ,current_color,current_color,current_color,current_color,scale_alpha);
			_draw_x += string_width(_char);
			}
		}
	}
}

//[Vibecode] [Refactor] - what on earth is this slop; why is this function different everywhere  .___.
function scr_pause_text( x, y, _text, _progress, _type, c_color1, c_color2)
{
	var _draw_x = 0;
	var _draw_y = 0;
	
	for (var _i = 1; _i <= _progress;_i++)
	{
		var _char = string_char_at(_text, _i); //call the exorcist
		
		/////Add effect
		//Variable
		var move_x = -(string_length(_text)*3.95); //MY EYES 
		//render the text... count the length... multiply it by 3.95 (causes pixel tear), then move negative?
		var move_y = 0;
			
		var scale_x = 1;
		var scale_y = 1;
		var scale_alpha = 1;
		var text_rotate = 0; //yes the default angle is 0 Claude we do not need to define it 
		var current_color = c_color1; 
		//Effect
		
		//Mini picture
		var _used = 0
		for (var o = 0; o < array_length(actual_key_word); ++o) { //as opposite to those fake key words? 
				
			if string_copy(_text,_i,string_length(actual_key_word[o])) = actual_key_word[o]
			{
				//the most specific positioning, hard-coded 
				draw_sprite_part_ext(spr_gamepad_icon,0,48,8,13,7,(x-18)+_draw_x+move_x,(y-6)+_draw_y+move_y-7,2,2,c_white,1)
				_i += string_length(actual_key_word[o]) - 1
				_draw_x += 10
				_used = 1 //really... 
				break;
			}
		}
		//Text
		if (_used == 0)
		{
		//if you like local variable spam... Shenvinbot made everything a variable, but it's not needed 
		draw_text_transformed_color(x + _draw_x+ move_x,y + _draw_y+move_y, _char, scale_x, scale_y, 
		text_rotate ,current_color,current_color,current_color,current_color,scale_alpha);
		_draw_x += string_width(_char);
		}
	}
}