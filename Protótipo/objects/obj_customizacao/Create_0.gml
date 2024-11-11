#region DefinicaoCustomizacao

customizacao_selecionada = -1; // guarda a customizacao atual
// vetor que armazena o nome da customizacao i
customizacao[0] = "Cor de pele"; 
customizacao[1] = "Cor da calça";
customizacao[2] = "Camiseta";
customizacao[3] = "Cabelo";
customizacao[4] = "Cor do cabelo";

// opcao_selecionada[i] guarda a opção selecionada na customização i
num_atributos = 5;
for (i = 0; i < num_atributos; i++) { 
	opcao_selecionada[i] = 0;
}

// customizacao[0] = Cor da pele
atributo[0,0] = "Branco";
atributo[0,1] = "Marrom"; 

// customizacao[1] = Calça
atributo[1, 0] = "Preta";
atributo[1, 1] = "Verde";

// customizacao[2] = Estilo da camiseta
atributo[2, 0] = "Estampada";
atributo[2, 1] = "Lisa";

// customizacao[3] = Estilo do cabelo
atributo[3, 0] = "Longo";
atributo[3, 1] = "Curto";

// customizacao[4] = Cor do cabelo
atributo[4, 0] = "Cinza";
atributo[4, 1] = "Castanho";
atributo[4, 2] = "Loiro";

/*0 se menu atual é o das customizações
  1 se menu atual é o das opções em uma customização*/
menu_atual = 0;

customizacao_finalizada = 0;
#endregion

/*--------------------- DEFINIÇÕES DE DESENHO E POSIÇÃO ---------------------*/
// camera padrão
var camera = view_camera[0];

// (x, y) de início da camera 0
var camera_x = camera_get_view_x(camera); 
var camera_y = camera_get_view_y(camera);

// altura e largura de início da camera 0
var largura_camera = camera_get_view_width(camera);
var altura_camera = camera_get_view_height(camera);

// espaço entre a borda esquerda/inferior e o desenho do personagem
var deslocamento_x = 1/80 * largura_camera;
var deslocamento_y = -1/45 * altura_camera;

escala_x = 2/800 * largura_camera;
escala_y = 2/450 * altura_camera;
largura_desenho = sprite_get_width(spr_corpo) * escala_x;
altura_desenho = sprite_get_height(spr_corpo) * escala_y;

// (x, y) do personagem desenhado
x = (sprite_get_width(spr_corpo) * escala_x)/2 + deslocamento_x;
y = (camera_y + altura_camera) - ((sprite_get_height(spr_corpo) * escala_y)/2) + deslocamento_y;

display_x_metade = (camera_x + largura_camera) / 2;
display_y_metade = (camera_y + altura_camera) / 2;