/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
instance_create_layer(random(640), random(360), layer, enemy);
time = max(time-1, 10);
alarm[0] = time;