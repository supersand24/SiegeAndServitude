draw_set_valign(fa_middle);
draw_set_halign(fa_left);

draw_sprite_stretched(ui_button_big,pressed,x,y,string_width(name)+32,26);
draw_text(x+16,y+13,name);