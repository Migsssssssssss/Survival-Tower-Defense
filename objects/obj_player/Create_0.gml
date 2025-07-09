
spd = 3
hspd = 0
vspd = 0

_manual_fire = 0

arma = noone

can_knocback = true

randomize()

//Criando o Método De Controlar a Arma
usa_arma = function(){
	if (arma){
		var _auto_fire = mouse_check_button(mb_left)
		_manual_fire = mouse_check_button_pressed(mb_left)
		arma.atirar = _auto_fire
		arma.atirar_manual = _manual_fire
		

		
		var _direc = point_direction(x, y, mouse_x, mouse_y)
		
		//Levando a Arma Conosco (fazer a arma seguir o player)
		arma.x = x
		arma.y = y + 7
		
		
		//Achando a Posição Arma 
		arma.image_angle = _direc
		
		var _knockback_force = arma.knockback_force
		var _knockback_dir = _direc - 180
		
		if (arma.is_automatic){
			
			if (_auto_fire){
				hspd += lengthdir_x(_knockback_force, _knockback_dir)
				vspd += lengthdir_y(_knockback_force, _knockback_dir)
			}
		} else {		
			if (arma.knockback_time > 0){
				hspd += lengthdir_x(_knockback_force, _knockback_dir)
				vspd += lengthdir_y(_knockback_force, _knockback_dir)
			}		
		}
	}
}

//Criando Método Para Me Livrar De Uma Arma
joga_arma = function(){
	if (arma){
		var _joga = mouse_check_button_released(mb_right)
		if (_joga){
			arma.player_with_gun = false
			arma.speed = 15
			arma.direction = arma.image_angle
			arma = noone
		}
	}
}