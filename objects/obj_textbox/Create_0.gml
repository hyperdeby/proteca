/// @description Inicialização das variáveis da caixa de diálogos

// textbox parameters
textbox_width = 512;
textbox_height = 256;
textbox_x_offset = 44;
border = 8;
line_sep = 15;
line_width = textbox_width - border*2;
textbox_spr = spr_textbox_background;

// the text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

char[0,0] = "";
// remember char_x[character,page_number]
char_x[0,0] = 0;
char_y[0,0] = 0;

draw_char = 0;
text_spd = 0.5;

// options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

// effects
scr_set_defaults_for_text();
last_free_space = 0;
