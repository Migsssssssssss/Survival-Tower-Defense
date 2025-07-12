

if mouse_check_button_pressed(mb_right){
	 
	
	if (other.arma == noone && other.can_get_gun){
		player_with_gun = true
		other.arma = id
		other.can_get_gun = false
		
	} 
	
	if (other.arma && other.arma != id && other.secondary_gun == noone){
	
		other.secondary_gun = id
		
		
	}
}

