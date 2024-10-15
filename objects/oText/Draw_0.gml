/// @description Insert description here
// You can write your code in this editor

var prev_color = draw_get_color();
var prev_alpha = draw_get_alpha();
var prev_font = draw_get_font();
var prev_halign = draw_get_halign();
var prev_valign = draw_get_valign()

var halfw = w * 0.5;

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_roundrect_ext(x - halfw-border, y-h-(border*2), x+halfw+border, y, 15,15,false);  //draw rectangle with radius  
draw_sprite(sMarker,0,x,y);
draw_set_alpha(1);


//Draw text
draw_set_colour(c_white);
draw_set_font(fnt_ComicSans);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x, y-border-h, text_current);


draw_set_color(prev_color);
draw_set_alpha(prev_alpha);
draw_set_font(prev_font);
draw_set_halign(prev_halign);
draw_set_valign(prev_valign);