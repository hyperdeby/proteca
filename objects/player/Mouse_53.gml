/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
with(instance_create_layer(x, y, layer, bullets))
{
	direction = point_direction(x, y, mouse_x, mouse_y);
	speed = 6;
}