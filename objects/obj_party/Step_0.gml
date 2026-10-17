//step


//for (var i = 0; i < array_length(char_list); ++i) {

if (hp[0] > hp_max[0]) || (hp[0] < 0)
{
	hp[0] = hp_max[0]
}

//}

if keyboard_check_pressed(ord("P"))
{
	hp[0]--;
}

if (global.paused == true)
{
if (keyboard_check_pressed(vk_down))
{select_character += 1}
else if (keyboard_check_pressed(vk_up))
{select_character -= 1}

if (select_character < 0)
{
	select_character = array_length(char_list) - 1
}
else if (select_character >= array_length(char_list))
{
	select_character = 0
}

}
