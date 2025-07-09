
/// Valores Geralmente Usados Por Mim

/// draw_text_color_outline_new(x, y, "Texto", 6, c_black, 8)

function draw_text_color_outline(x, y, texto, grossura, cor_contorno, num_direcoes) {
	var cor_original = draw_get_color();
	draw_set_color(cor_contorno);
	
	for (var i = 0; i < 360; i += 360 / num_direcoes) {
		draw_text(x + round(lengthdir_x(grossura, i)), y + round(lengthdir_y(grossura, i)), texto);
	}
	
	draw_set_color(cor_original);
	draw_text(x, y, texto);
}
