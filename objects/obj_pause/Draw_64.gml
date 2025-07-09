
var _W = display_get_gui_width()
var _H = display_get_gui_height()

if (global.pause){
	draw_set_alpha(0.3)
	draw_set_color(c_black)

	draw_rectangle(0, 0, _W, _H, 0)

	draw_set_alpha(1)
	draw_set_color(c_white)

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	draw_set_font(ft_pixel)
	draw_text_color_outline(_W / 2, _H / 2, "Paused", 6, c_black, 8)
}

draw_set_font(-1)