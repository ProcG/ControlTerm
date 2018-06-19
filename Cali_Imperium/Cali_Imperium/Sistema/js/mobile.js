document.getElementById("open_menu").onclick = function () {
    var menu = document.getElementById("menu");

    if (menu.className == "menu menuOff") {
        menu.className = "menu menuOn";
    } else {
        menu.className = "menu menuOff";
    }
}