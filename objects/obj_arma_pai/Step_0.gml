
atirando()

var key_reload = keyboard_check_pressed(ord("R"))

/// Parametros Para Poder Recarregar a Arma
if (key_reload && obj_player.arma && !is_reload && mag_ammo < mag_size && reserve_ammo > 0){
	is_reload = true
}

if (is_reload){
	image_blend = c_red
} else {
	image_blend = c_white
}

// Fazendo a Arma Virar Na Vertical Se o Mouse Estiver na Esquerda
if (obj_player.arma == id){
	if (mouse_x < x){
		image_yscale = -1
	} else {
		image_yscale = 1
	}
}

//Perdendo a Velocidade Ao Ser Aremessada
if (speed > 0){
	speed *= 0.9
	image_angle += 0.4
	if (speed <= 0.1){
		speed = 0
		image_angle --
	}
}