// Movimentação do personagem
if keyboard_check(vk_up) {
	y -= 1
}

if keyboard_check(vk_down) {
	y += 1
}

if keyboard_check(vk_left) {
	x -= 1 image_xscale=-1 // image_xscale é para mudar a escala do personagem. No caso inverter o lado
}

if keyboard_check(vk_right) {
	x += 1 image_xscale=1
}

// Passagem de fase com quantidade de flores coletadas
if flor = 3 {
	room_goto_next()
}

// Colocando o Sprite do personagem correndo quando clicar qualquer seta
if keyboard_check(vk_anykey) {
	sprite_index = sPlayerCorre
}
else {
	sprite_index = sPlayer
}