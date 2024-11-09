/// @description Aplica as configurações globais que serão usadas durante o jogo
// Carrega a fonte personalizada provisória
global.font_main = font_add_sprite(spr_font,32,true,1);
// Carrega os diálogos do arquivo na variável dialogos
global.dialogos = import_json("dialogosArray.json",json_parse);