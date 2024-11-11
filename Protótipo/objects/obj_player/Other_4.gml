ini_open("save.ini");

var saved_x = ini_read_real("Player", "x_atual", 48);
var saved_y = ini_read_real("Player", "y_atual", 112);
var saved_vida = ini_read_real("Player", "vida", 100);
var saved_pontos = ini_read_real("Player", "pontos", 0);
var saved_nivel = ini_read_real("Player", "nivel", 1);   

ini_write_real("Player","room", real(room));

ini_close();

if ((saved_x != -1) && (saved_y != -1)) {
    x = saved_x;
    y = saved_y;
	vida = saved_vida;
	pontos = saved_pontos;
	nivel = saved_nivel;
}
