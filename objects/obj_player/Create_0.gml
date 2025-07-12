
spd = 0					// Velocidade
max_spd = 3				// Velocidade Maxima
acc = 0.3				// Aceleração 
dcc = 0.3				// Desaceleração

move_dir = 0			// Direção Do Movimento

hspd = 0				// Velocidade Horizontal
vspd = 0				// Velocidade Vertical

can_damage = true		// Pode Levar Dano
life = 10				// Vida

_manual_fire = false	// Tiro manual
can_get_gun = true
arma = noone			// Esta Com Uma Arma
secondary_gun = noone
pickup_delay = 0

state = scr_player_free // Estado Do Player

randomize()				// Randomiza Valores Aleatórios

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
			
			if (_auto_fire && arma.mag_ammo > 0){
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
		var _joga = mouse_check_button_pressed(mb_right)
		if (_joga && secondary_gun != noone){
			arma.player_with_gun = false
			arma.speed = 15
			arma.direction = arma.image_angle
			arma = noone
			

			// Delay para não pegar a secundária no mesmo frame
			pickup_delay = 10;
		}
	}
}


arma_secundaria = function(){

	if (secondary_gun){
	
		secondary_gun.image_angle = -90
		secondary_gun.x = approach(secondary_gun.x, x - 25 * image_xscale, 10)
		secondary_gun.y = approach(secondary_gun.y, y - 6, 10)
		secondary_gun.image_yscale = image_xscale
	
	}

}

troca_arma = function(){

	if (pickup_delay > 0){
		pickup_delay -= 1;
	}

	if (arma == noone && secondary_gun != noone && pickup_delay <= 0){
		// Faz a Secundária Virar Principal
		arma = secondary_gun;
		secondary_gun = noone;

		//Atualiza o Status Da Arma
		arma.player_with_gun = true;
	}
	else if (keyboard_check_pressed(ord("Q")) && secondary_gun != noone){
		// Define a arma atual como não equipada
		arma.player_with_gun = false;
		secondary_gun.player_with_gun = true;

		// Troca as referências
		var temp = arma;
		arma = secondary_gun;
		secondary_gun = temp;
	}
}

