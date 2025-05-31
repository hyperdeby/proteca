inventory := new Inventory();
is_open := true;

function no_effect(){return "use"};

var hair := new Item(1, "cabelo", sprHair, "cabelo loiro", no_effect);
var pants := new Item(2, "calca", sprPants, "Calça jeans", no_effect);
inventory.add_item(hair);
inventory.add_item(pants);