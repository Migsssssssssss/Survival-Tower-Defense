/// @description Barras De Ações (HUD)6

draw_self()
if (player_with_gun){
	var percent = clamp(delay_projectile / delay_max, 0, 1);

	bar_size_max = 2;

	var bar_yscale = 0.2
	
// Desenhando Barra De Recoil Da Arma (dlay_projtile)
	draw_sprite_ext(spr_bar, 0, obj_player.x - 35, obj_player.y - 25, percent * bar_size_max, bar_yscale, 0, c_white, 1);
	
// Desenhando Barra De Fundo
	draw_sprite_ext(spr_bar_back, 0, obj_player.x - 35, obj_player.y - 25, 0.7, 0.3, 0, c_white, 1)
		
	if (is_reload){
// Desenhando Barra De Reload
		var percent_reload_bar = clamp(reload_time_max / reload_percent, 0, 1)
		draw_sprite_ext(spr_bar_reload, 0, obj_player.x - 35, obj_player.y - 25, percent_reload_bar * bar_size_max, bar_yscale, 0, c_white, 1)
	}
} else {
	bar_size_max = 0
}


