// deleta o save anterior
if (file_exists("save.ini"))
	file_delete("save.ini")
		
ini_open("save.ini");

ini_write_real("Player","x_atual", obj_player.x);
ini_write_real("Player","y_atual", obj_player.y);
ini_write_real("Player","room", real(room));
ini_write_real("Player","nivel", obj_player.nivel);
ini_write_real("Player","pontos", obj_player.pontos);
ini_write_real("Player","vida", obj_player.vida);
ini_write_real("Player", "cabelo", obj_player.cabelo);
ini_write_real("Player", "cor_cabelo", obj_player.cor_cabelo);
ini_write_real("Player", "camiseta", obj_player.camiseta);
ini_write_real("Player", "cor_calca", obj_player.cor_calca);
ini_write_real("Player", "cor_corpo", obj_player.cor_corpo);
		
ini_close();
		
show_message("Vida: " + string(obj_player.vida) + "\nPontos: " + string(obj_player.pontos) + "\nNível: " + string(obj_player.nivel));
