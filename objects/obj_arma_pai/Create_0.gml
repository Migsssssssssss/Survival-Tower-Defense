
#region Especificações Das Armas
//Velocidade de projectile (cadencia)
//delay do projectile (tempo de espera até o próximo projectile)
//projectile (qual progétio a arma ira usar)
#endregion

sprite_index = weapon_sprite


//Minução
is_reload = false
mag_ammo = mag_size

reload_percent = reload_time * room_speed
reload_time_max = reload_time * room_speed

//Criando o Método Para Atirar
atirar = false
atirar_manual = false
can_projectile = true

//Delay Para Atirar
delay_projectile = 0
delay_max = shot_delay * room_speed;

knockback_time = 0

player_with_gun = false
bar_size_max = 2;

can_subtract_knocback_time = false


atirando = function(){
	
	if (player_with_gun){
		if (mag_ammo > 0 && !is_reload){
			if (is_automatic){
				if (atirar){
					//Criando o projectile Dentro Do Intervalo
					delay_projectile --
					if (delay_projectile <= 0){
			
						//Resetando o Delay Do projectile
						delay_projectile = shot_delay * room_speed
			
						//Achando a Posição Do Meu projectile
						var _x = lengthdir_x(sprite_width, image_angle)
						var _y = lengthdir_y(sprite_width, image_angle)
			
						//Atirando
						var _projectile = instance_create_layer(x + _x, y + _y, layer, projectile)
						
						_projectile.sprite_index = projectile_sprite
						_projectile.knockback_force = knockback_force
						_projectile.damage = damage
			
						//Dando Velocidade Para o projectile
						_projectile.speed = projectile_speed
			
						// Definindo a Direção Do projectile com imprecisão
						var precisao = random_range(-inaccuracy , inaccuracy );
						_projectile.direction = image_angle + precisao;
						_projectile.image_angle = image_angle
					}	
				} else { delay_projectile = 0 }
			} else {
		
				if (atirar_manual){
					if (can_projectile){
				
						//Resetando o Delay Do projectile
						delay_projectile = shot_delay * room_speed
						knockback_time = knockback_duration * room_speed
				
						//Achando a Posição Do Meu projectile
						var _x = lengthdir_x(sprite_width, image_angle)
						var _y = lengthdir_y(sprite_width, image_angle)
			
						//Atirando
						var _projectile = instance_create_layer(x + _x, y + _y, layer, projectile)
					
						_projectile.sprite_index = projectile_sprite
						_projectile.knockback_force = knockback_force
						_projectile.damage = damage
			
						//Dando Velocidade Para o projectile
						_projectile.speed = projectile_speed
			
						//Definindo a Direção Do projectile
						_projectile.direction = image_angle
						_projectile.image_angle = image_angle
				
						can_subtract_knocback_time = true
						can_projectile = false
					} 
				}
		
			if (can_subtract_knocback_time){
				knockback_time--
				
				if (knockback_time <= 0){
					can_subtract_knocback_time = false
				}
			}
		
				if (can_projectile == false){
				delay_projectile --
				
				
					if (delay_projectile <= 0){
					can_projectile = true
					}
				}
			}
		} else {
			
			if (player_with_gun && reload_time_max > 0 && reserve_ammo > 0){
				
				is_reload = true
				reload_time_max --
			} else if (player_with_gun){
				
			/// Calcular Quanto Falta Para Encher o Pente e Reduzir Da Reserva Apenas Esse Valor
				var needed = mag_size - mag_ammo;
				if (reserve_ammo >= needed) {
					reserve_ammo -= needed;
					mag_ammo = mag_size;
				} else {
					mag_ammo += reserve_ammo;
					reserve_ammo = 0;
				}
				
				reload_time_max = reload_time * room_speed
				is_reload = false
				
			}
			knockback_time --
			delay_projectile = 0
		}
	}
}

