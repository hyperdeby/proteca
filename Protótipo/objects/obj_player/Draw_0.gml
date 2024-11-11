// Desenha corpo
draw_sprite_ext(spr_corpo, 0, x, y, escala_x, escala_y, 0, retCorPele(cor_corpo), 1);

// Desenha calça
draw_sprite_ext(spr_calca, 0, x, y, escala_x, escala_y, 0, retCorCalca(cor_calca), 1);

// Desenha camiseta
draw_sprite_ext(spr_camiseta, camiseta, x, y, escala_x, escala_y, 0, c_white, 1);

// Desenha cabelo
draw_sprite_ext(spr_cabelo, cabelo, x, y, escala_x, escala_y, 0, retCorCabelo(cor_cabelo), 1);
