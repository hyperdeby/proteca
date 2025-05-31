if (!is_open) exit; // Não desenha se o inventário estiver fechado

var slot_size = 64;
var start_x = display_get_gui_width() / 2 - 2 * slot_size; // Centraliza horizontalmente
var start_y = display_get_gui_height() / 2 - 2 * slot_size; // Centraliza verticalmente
var padding = 10; // Espaçamento entre slots

draw_rectangle(start_x - 50, start_y - 50, start_x + 270, start_y + 270, false)

for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
        var index_slot = i * 4 + j;
        var x_pos = start_x + j * (slot_size + padding);
        var y_pos = start_y + i * (slot_size + padding);
        
        // Desenha o fundo do slot
        draw_sprite(spr_slot_background, 0, x_pos, y_pos);
        
        // Desenha o item, se existir
        var items = inventory.slots[index_slot];
        if (items != -1) {
            draw_sprite(items.sprite_item , 0, x_pos, y_pos);
        }
    }
}