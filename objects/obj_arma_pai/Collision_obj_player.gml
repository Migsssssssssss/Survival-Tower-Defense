
// Colidir Com o Player, Eu Vou Ser a Arma Dele SE Ele Não Tem Arma
if mouse_check_button_pressed(mb_right) && (other.arma == noone) && (!other.can_release_gun){
	player_with_gun = true
	other.arma = id
	other.can_release_gun = true
}

