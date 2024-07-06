x += hsp
y += vsp

// Serra ficar dentro do mapa
if x<0 {
	hsp =- hsp
}

if x>room_width {
	hsp =- hsp
}

if y<0 {
	vsp =- vsp	
}

if y>room_height {
	vsp =- vsp
}
