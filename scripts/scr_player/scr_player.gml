
function scr_player_free(){
	
	var key_right = keyboard_check(ord("D"))
	var key_left = keyboard_check(ord("A"))
	var key_up = keyboard_check(ord("W"))
	var key_down = keyboard_check(ord("S")) 


	var _direc = point_direction(x, y, mouse_x, mouse_y)

	if (_direc > 90 && _direc < 270){
			image_xscale = -1
		}else{image_xscale = 1}	 

	var move = (key_right - key_left != 0 || key_down - key_up != 0)

	if (move){
		move_dir = point_direction(0, 0, key_right - key_left, key_down - key_up)
		spd = approach(spd, max_spd, acc)
		sprite_index = spr_run
	} else {

		spd = approach(spd, 0, dcc)
		sprite_index = spr_idle
	}
	
	hspd = lengthdir_x(spd * move, move_dir)
	vspd = lengthdir_y(spd * move, move_dir)
	
}

function scr_player_knockback(){

	knockback_force = lerp(knockback_force, 0, 0.05)
	
	hspd = lengthdir_x(knockback_force, knockback_dir)
	vspd = lengthdir_y(knockback_force, knockback_dir)



}