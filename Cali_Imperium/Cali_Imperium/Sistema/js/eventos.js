/*ATENÇÃO, VOCÊ NÃO ENTENDERA NADA DO QUE ESTÁ AQUI, POIS ATÉ EU QUE CRIEI NÃO SEI O PQ DE FUNCIONAR :C*/
var temperatura_atual = 0, nova_temperatura = 0; // cria as variaveis que faram as "animações" com os numeros da temperatura
var temperatura_minima = 0;
var temperatura_maxima = 0;



//* parametros => de forma bem simplificade é: tudo oq tem dentro dos '()' ao se declarar uma funcao
// ex: function MinhaFuncao(numero) o parametro no caso é o 'numero', em 'MinhaFuncaio'
//voce pasara um 'numero' que será responsavel por fazer algo no codgio

window.onload = function(){

    var ctx = document.getElementById("chart").getContext("2d");
    ctx.canvas.width = 1000;
    ctx.canvas.height = 600;

    myChart = new Chart(ctx, {
        animation: true,
        type: 'line',
        data: {
            //labels: ["", "", "", ""],
            datasets: [{
                label: "Temperatura",
                borderColor: '#000',
                backgroundColor: '#fff',
                fill: false,
                //data: []

            }]
        },
        options: {
            layout: {
                padding: {
                    left: 50,
                    right: 50,
                    top: 20,
                    bottom: 20
                }
            },
            title: {
                display: true,
                text: 'Últimas Temperaturas',
                fontSize: 13,
                padding: 20
            },
            legend: {
                position: 'bottom',
                labels: {
                    boxWidth: 15
                },
            },

            scales: {
                yAxes: [{
                    gridLines: {
                        display: true,
                        color: "#62e0e466"
                    }
                }],
                xAxes: [{
                    gridLines: {
                        display: true,
                        color: "#62e0e466"
                    }
                }],
            }
        }
    });

}

function addTemp(temp) {
    if (myChart.data.datasets[0].data.length == 6) {
        myChart.data.labels.shift();
        myChart.data.datasets[0].data.shift();
    }

    myChart.data.labels.push("");
    myChart.data.datasets[0].data.push(temp);
    myChart.update();
}

function atualiza_numeros(antes, agora, min, max) {// declara uma função com o nome de 'atualiza_numeros' COM parametros* com a temperatura que está 
    temperatura_atual = antes;           // marcando agora na página representada pelo parametro(variavel) 'antes',
    nova_temperatura = agora;            // e a nova temperatura representado pelo 'agora'

    temperatura_minima = min;
    temperatura_maxima = max;

    atualiza_termometro();
    addTemp(agora);
    
    // executa a função responsavel por fazer a animação da temperatura
}// fim função que chama outras funções para atualizar a temperatura

function atualiza_termometro() { // declara uma função com o nome de 'atualiza_termometro' SEM parametros
    if (temperatura_atual != nova_temperatura) { // if para saber quando a temperatura que está marcada no site, será igual a nova temperatura registrada

        setTimeout(atualiza_termometro, 100); // setTimeuot é uma função que da um delay na execução do codigo, nele é preciso passar dois parametros, 1º => a função que voce quer q tenha delay, e o tempo de delay em MS
        atualiza_fundo_termometro(temperatura_atual); // executa a funçãp para alterar a cor da div do fundo do termometro
        alerta(temperatura_atual); // executa a função que gera o alerta com som

        // infos_temperatura(temperatura_atual); // executa a função que mostra na tela os textos sobre a temperatura    

    }
    //document = html, getElementById = pegar o elemento HTML que possua o id, "txt_temperatura" -> nome da ID, innerHTML -> escrever no html, temperatura_atual + "°c" -> escreve a temperatura em atualização
    document.getElementById("txt_temperatura").innerHTML = temperatura_atual + "°c";
    //Aqui estamos escrevendo dentro do html onde está marcando a temperatura (dash.html)

    if (temperatura_atual < nova_temperatura) { // se a temperatura_atual for menor que a nova_temperatura
        temperatura_atual++; // a temperatura_atual é incrementa de 1 em 1, mesma coisa de temperatura_atual = temperatura_atual + 1; so que com '++' é simplificado isso

    }//fim if
    else if (temperatura_atual > nova_temperatura) { // se a temperatura_atual for maior que a nova_temperatura
        temperatura_atual--;// a temperatura_atual é subtraida de 1 em 1 ate chegar na nova temperatura
    }// fim else if

}// fim função para fazer animação de numeros

function atualiza_fundo_termometro(grau) {// função COM parametro para atualizar o fundo da div de temperatura 
    if (grau <= 3) { // se grau for menor q 11

        // * as classes são usadas para que o css consiga aplicar os efeitos

        //busca o elemento que tem "area_termometro"

        document.getElementById("area_termometro").className = "gelado";
        document.getElementById("ult_att").innerHTML = "Gelado";
        // adiciona uma CLASSE* nesse ID referenciado
    }
    else if (grau <= 10) { // etc
        document.getElementById("area_termometro").className = "frio";
        document.getElementById("ult_att").innerHTML = "Frio"; // adiciona uma nova classe
    } else if (grau <= 18) {
        document.getElementById("area_termometro").className = "fresco";
        document.getElementById("ult_att").innerHTML = "Fresco";
    } else if (grau <= 24) {
        document.getElementById("area_termometro").className = "ameno";
        document.getElementById("ult_att").innerHTML = "Ameno";
    } else if (grau <= 30) {
        document.getElementById("area_termometro").className = "calor_moderado";
        document.getElementById("ult_att").innerHTML = "Calor Moderado";
    } else if (grau <= 40) {
        document.getElementById("area_termometro").className = "calor_forte";
        document.getElementById("ult_att").innerHTML = "Calor Forte";
    } else if (grau > 40) {
        document.getElementById("area_termometro").className = "escaldante";
        document.getElementById("ult_att").innerHTML = "Escaldante";
    }

}

function alerta(grau) { // função com parametro para gerar um alerta sonoro
    if (grau <= temperatura_minima || grau >= temperatura_maxima) { // faz a comparação para saber se a temperatura está em na faixa
        document.getElementById("alerta").play();// busca o tag <audio> no html que possua um id "alerta" -> <audio id="alerta"> e da um play nele
        document.getElementById("pisca").className = "pos_area_termo armado";
    } else { // se nao estiver nesse periodo
        document.getElementById("alerta").pause(); // busca a tag <audio> que possua o id "alerta" e da um pause
        document.getElementById("pisca").className = "pos_area_termo";
    }
}

function remove_infos() { // função para remover os textos sobre as temperaturas -> presente em dash.html 
    var div = document.getElementById("textos");// declara uma variavel que guardara a DIV q possua o id "textos"
    var pt = document.getElementById("desc_temp");// declara uma variavel que guardara <DIV> q possua o id "desc_temp"
    var p = div.getElementsByTagName("p");// // declara uma variavel que guardara <p>. TagName = nome da temp (:p)

    try {//tente executar o código
        pt.parentNode.removeChild(p[0]);//pega a div que guarda os <p>, e remove todos o <p> dentro, ele retorna um vetor de <p> e nos pegamos o primeiro, ai fica p[0]
    } catch (err) { } // se nao der nao faça nada




}//fim fuñção remove

function getSizeP() {// função gambiarra que faz a mesma coisa da função remove_info, so q ao inves de excluir, ele retorna a qnt de <p> que existe

    var div = document.getElementById("textos"); // acho q tu ja entendeu oq faz aqui
    var p = textos.getElementsByTagName("p");

    return p.length * 5;// retorna a quantidade de <p> existentes dentro da div#textos e multiplica por 5, pq? GAMBIARRA. o numero 5 foi o numero mais baixo q fez com q funcionasse D:
}//fim gamibarra


function getRandom(max) {// função que nao existira mais tarde, ele retorna numeros aleatorios
    Math.floor(Math.random() * max)
}


function getViewConfiguracoes() {// função para abrir a tela de configuração, acho q voce ja entendeu como funciona isso, se voce viu os exemplos acima, mas vamos lá
    var div_fundo = document.getElementById("fundo_modal");// adiciona a uma variavel, a referencia que busca a div que possui o ID "fundo modal"
    div_fundo.className = "";// tira todas as classes da div que referenciamos acima
    div_fundo.className = "fundo_modal_on"; //adiciona uma classe para que o css aplique o efeito, no caso para mostrar a tela
}

function removerViewConfiguracoes() {// função para remover a tela de configurações
    var div_fundo = document.getElementById("fundo_modal");// msm coisa
    div_fundo.className = "";//remove as classe
    div_fundo.className = "fundo_modal_off"; //adiciona a classe para esconder a tela, classe adicionada para o css aplicar o efeito
}


function getViewAddArduino() { // mesma coisa da getViewConfiguracoes
    var div_fundo = document.getElementById("fundo_modal_arduino");
    div_fundo.className = "";
    div_fundo.className = "fundo_modal_arduino_on";
}

function removerViewAddArduino() {// mesma coisa da removerViewConfiguracoes
    var div_fundo = document.getElementById("fundo_modal_arduino");
    div_fundo.className = "";
    div_fundo.className = "fundo_modal_arduino_off";
}

/* abrir e fechar janela modal temperatura modal */
function abrirmodal() {
    var div_fundo = document.getElementById("modal");
    div_fundo.className = "";
    div_fundo.className = "modal_on";
}

function fecharmodal() {
    var div_fundo = document.getElementById("modal");
    div_fundo.className = "";
    div_fundo.className = "modal_off";
}
/* fim janela modal temperaturA */