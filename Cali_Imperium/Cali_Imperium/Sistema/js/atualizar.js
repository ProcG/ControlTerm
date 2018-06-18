var antes_minima = 0, depois_minima = 0;

function att_minima(depoisMinima) {
    antes_minima = document.getElementById("txtMinima").innerHTML.replace("°c","");
    depois_minima = depoisMinima;


    contadorMinima();
}

function contadorMinima() {


    if (antes_minima != depois_minima) {
        setTimeout(contadorMinima, 100);
    }

    document.getElementById("txtMinima").innerHTML = antes_minima + "°c";;

    if (antes_minima >= depois_minima) {
        antes_minima--;
    }
    else if (antes_minima <= depois_minima) {
        antes_minima++;
    }

}

var antes_2Q = 0, depois_2Q = 0;

function att_2Q(depois2Q) {
    antes_2Q = document.getElementById("txt2Q").innerHTML.replace("°c", "");
    depois_2Q = depois2Q;


    contador2Q();
}

function contador2Q() {


    if (antes_2Q != depois_2Q) {
        setTimeout(contador2Q, 100);
    }

    document.getElementById("txt2Q").innerHTML = antes_2Q + "°c";;

    if (antes_2Q >= depois_2Q) {
        antes_2Q--;
    }
    else if (antes_2Q <= depois_2Q) {
        antes_2Q++;
    }

}

var antes_Mediana = 0, depois_3Mediana = 0;

function att_Mediana(depoisMediana) {
    antes_Mediana = document.getElementById("txtMediana").innerHTML.replace("°c", "");
    depois_Mediana = depoisMediana;


    contadorMediana();
}

function contadorMediana() {


    if (antes_Mediana != depois_Mediana) {
        setTimeout(contadorMediana, 100);
    }
    
    document.getElementById("txtMediana").innerHTML = antes_Mediana + "°c";

    if (antes_Mediana >= depois_Mediana) {
        antes_Mediana--;
    }
    else if (antes_Mediana <= depois_Mediana) {
        antes_Mediana++;
    }

}


var antes_3Q = 0, depois_3Q = 0;

function att_3Q(depois3Q) {
    antes_3Q = document.getElementById("txt3Q").innerHTML.replace("°c", "");
    depois_3Q = depois3Q;


    contador3Q();
}

function contador3Q() {


    if (antes_3Q != depois_3Q) {
        setTimeout(contador3Q, 100);
    }
    
    document.getElementById("txt3Q").innerHTML = antes_3Q + "°c";

    if (antes_3Q >= depois_3Q) {
        antes_3Q--;
    }
    else if (antes_3Q <= depois_3Q) {
        antes_3Q++;
    }

}

var antes_Maxima = 0, depois_Maxima = 0;

function att_Maxima(depoisMaxima) {
    antes_Maxima = document.getElementById("txtMaxima").innerHTML.replace("°c","");
    depois_Maxima = depoisMaxima;


    contadorMaxima();
}

function contadorMaxima() {


    if (antes_Maxima != depois_Maxima) {
        setTimeout(contadorMaxima, 100);
    }
    
    document.getElementById("txtMaxima").innerHTML = antes_Maxima + "°c";

    if (antes_Maxima >= depois_Maxima) {
        antes_Maxima--;
    }
    else if (antes_Maxima <= depois_Maxima) {
        antes_Maxima++;
    }

}


var antes_MediaM = 0, depois_MediaM = 0;

function att_MediaM(depoisMediaM) {
    antes_MediaM = document.getElementById("txtMedia").innerHTML.replace("°c", "");
    depois_MediaM = depoisMediaM;


    contadorMediaM();
}

function contadorMediaM() {


    if (antes_MediaM != depois_MediaM) {
        setTimeout(contadorMediaM, 100);
    }

    document.getElementById("txtMedia").innerHTML = antes_MediaM + "°c";

    if (antes_MediaM >= depois_MediaM) {
        antes_MediaM--;
    }
    else if (antes_MediaM <= depois_MediaM) {
        antes_MediaM++;
    }

}


function Analytics(minima, n2q, mediana, n3q, maxima, mediaM) {
    att_minima(minima);
    att_2Q(n2q);
    att_Mediana(mediana);
    att_3Q(n3q);
    att_Maxima(maxima);
    att_MediaM(mediaM);
}

