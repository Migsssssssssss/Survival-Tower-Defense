
function scr_player_free(){
	
	var key_right = keyboard_check(ord("D"))
	var key_left = keyboard_check(ord("A"))
	var key_up = keyboard_check(ord("W"))
	var key_down = keyboard_check(ord("S")) 


	var _direc = point_direction(x, y, mouse_x, mouse_y)

	if (_direc > 90 && _direc < 270){
			image_xscale = -1
		}else{image_xscale = 1}	 

	hspd = (key_right - key_left) * spd
	vspd = (key_down - key_up) * spd
	
}

function scr_player_knockback(){

	knockback_force = lerp(knockback_force, 0, 0.05)
	
	hspd = lengthdir_x(knockback_force, knockback_dir)
	vspd = lengthdir_y(knockback_force, knockback_dir)



}