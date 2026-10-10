scr_menu_control()

option_lenght = array_length(option[menu_lenght]);

pos += down_key - up_key;
if pos >= option_lenght {pos = 0};
if pos < 0 {pos = option_lenght-1};

if accept_key
{
	switch (menu_lenght)
	{
		case 0:
		switch (pos)
		{
			case(0):
			room_goto(rm_darkfields_1);
		
			break;
		
			case(1):
			menu_lenght = 1
		
			break;
		
			case(3):
			game_end();
			break;
		
		}
		break;
		
		case 1:
		switch (pos)
		{
			case(0):
		
			break;
		
			case(1):
		
			break;
		
			case(2):
			menu_lenght = 0
			break;
		
		}
		break;
	}
}