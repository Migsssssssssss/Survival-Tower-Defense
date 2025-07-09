/// @description Contador De Munição

draw_set_font(ft_pixel);

var Gui_W = display_get_gui_width();
var Gui_H = display_get_gui_height();

if (player_with_gun) {
    var txt = string(mag_ammo) + "/" + string(reserve_ammo);
    var margem = 20; // distância da borda
    draw_text_color_outline(Gui_W - margem - string_width(txt), Gui_H - margem - string_height(txt), txt, 6, c_black, 8);
}

draw_set_font(-1);
