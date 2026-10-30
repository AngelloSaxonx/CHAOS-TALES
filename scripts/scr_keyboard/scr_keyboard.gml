function scr_contol_setup()
{
	buffer_time = 30;
	jump_key_buffered = 0;
	jump_key_buffer_timer = 0;
}

function scr_get_control()
{
	right_key = keyboard_check(keys.right) + gamepad_button_check( 0, gamepad.right);
		right_key = clamp( right_key, 0, 1);
	right_key_pressed = keyboard_check_pressed(keys.right) + gamepad_button_check_pressed( 0, gamepad.right);
		right_key_pressed = clamp( right_key_pressed, 0, 1);
		
	left_key = keyboard_check(keys.left) + gamepad_button_check( 0, gamepad.left);
		left_key = clamp( left_key, 0, 1);
	left_key_pressed = keyboard_check_pressed(keys.left) + gamepad_button_check_pressed( 0, gamepad.left);
		left_key_pressed = clamp( left_key_pressed, 0, 1);
		
	down_key = keyboard_check(keys.down) + gamepad_button_check( 0, gamepad.down);
		down_key = clamp( down_key, 0, 1);
	down_key_pressed = keyboard_check_pressed(keys.down) + gamepad_button_check_pressed( 0, gamepad.down);
		down_key_pressed = clamp( down_key_pressed, 0, 1);
		
	up_key = keyboard_check(keys.up) + gamepad_button_check_pressed( 0, gamepad.up);
		up_key = clamp( up_key, 0, 1);
	up_key_pressed = keyboard_check_pressed(keys.up) + gamepad_button_check_pressed( 0, gamepad.up);
		up_key_pressed = clamp( up_key_pressed, 0, 1);
		
	jump_key_pressed = keyboard_check_pressed(keys.jump_act) + gamepad_button_check_pressed( 0, gamepad.jump_act);
		jump_key_pressed = clamp( jump_key_pressed, 0, 1);
	jump_key = keyboard_check(keys.jump_act) + gamepad_button_check( 0, gamepad.jump_act);
		jump_key = clamp( jump_key, 0, 1);
		
	attack_key = keyboard_check_pressed(keys.atk_cancel) + gamepad_button_check_pressed( 0, gamepad.atk_cancel);
		attack_key = clamp( attack_key, 0, 1);
		
	menu_key = keyboard_check_pressed(keys.menu) + gamepad_button_check_pressed( 0, gamepad.menu);
		menu_key = clamp( menu_key, 0, 1);
		
	accept_key = keyboard_check_pressed(keys.jump_act) + gamepad_button_check_pressed( 0, gamepad.jump_act);
		accept_key = clamp( accept_key, 0, 1);
		
	cancel_key = keyboard_check_pressed(keys.atk_cancel) + gamepad_button_check_pressed( 0, gamepad.menu);
		cancel_key = clamp( cancel_key, 0, 1);
	
	if jump_key_pressed
	{
		jump_key_buffer_timer = buffer_time;
		
	}
	
	if jump_key_buffer_timer > 0
	{
		jump_key_buffered = 1;
		jump_key_buffer_timer--;
	}
	else
	{
		jump_key_buffered = 0;
	}
}

function scr_menu_control()
{
	right_key = keyboard_check_pressed(keys.right) + gamepad_button_check_pressed( 0, gamepad.right);
		right_key = clamp( right_key, 0, 1);
		
	left_key = keyboard_check_pressed(keys.left) + gamepad_button_check_pressed( 0, gamepad.left);
		left_key = clamp( left_key, 0, 1);
	
	down_key = keyboard_check_pressed(keys.down) + gamepad_button_check_pressed( 0, gamepad.down);
		down_key = clamp( down_key, 0, 1);
		
	up_key = keyboard_check_pressed(keys.up) + gamepad_button_check_pressed( 0, gamepad.up);
		up_key = clamp( up_key, 0, 1);
	
	accept_key = keyboard_check_pressed(keys.jump_act) + gamepad_button_check_pressed( 0, gamepad.jump_act);
		accept_key = clamp( accept_key, 0, 1);
		
	cancel_key = keyboard_check_pressed(keys.atk_cancel) + gamepad_button_check_pressed( 0, gamepad.atk_cancel);
		cancel_key = clamp( cancel_key, 0, 1);	
}