
// Colidir Com o Player, Eu Vou Ser a Arma Dele SE Ele Não Tem Arma
if keyboard_check(ord("E")) && (other.arma == noone){
	player_with_gun = true
	other.arma = id
}