/*ATENÇÃO, VOCÊ NÃO ENTENDERA NADA DO QUE ESTÁ AQUI, POIS ATÉ EU QUE CRIEI NÃO SEI O PQ DE FUNCIONAR :C*/
var temperatura_atual = 0, nova_temperatura = 0; // cria as variaveis que faram as "animações" com os numeros da temperatura
var temp_menor_atual = 0, temp_menor_nova = 0; // cria as variaveis para fazer a mesma animação só q agora para a div de menor temperatura
var temp_media_atual = 0, temp_media_nova = 0; // -----------------------------------------------------------------------temperatura media
var temp_maior_atual = 0, temp_maior_nova = 0; // ----------------------------------------------------------------------maior temperatura

//* parametros => de forma bem simplificade é: tudo oq tem dentro dos '()' ao se declarar uma funcao
// ex: function MinhaFuncao(numero) o parametro no caso é o 'numero', em 'MinhaFuncaio'
//voce pasara um 'numero' que será responsavel por fazer algo no codgio


function atualiza_numeros(antes, agora) {// declara uma função com o nome de 'atualiza_numeros' COM parametros* com a temperatura que está 
    temperatura_atual = antes;           // marcando agora na página representada pelo parametro(variavel) 'antes',
    nova_temperatura = agora;            // e a nova temperatura representado pelo 'agora'
    atualiza_termometro(); // executa a função responsavel por fazer a animação da temperatura
}// fim função que chama outras funções para atualizar a temperatura

function atualiza_termometro() { // declara uma função com o nome de 'atualiza_termometro' SEM parametros
    if (temperatura_atual != nova_temperatura) { // if para saber quando a temperatura que está marcada no site, será igual a nova temperatura registrada

        setTimeout(atualiza_termometro, 100); // setTimeuot é uma função que da um delay na execução do codigo, nele é preciso passar dois parametros, 1º => a função que voce quer q tenha delay, e o tempo de delay em MS
        atualiza_fundo_termometro(temperatura_atual); // executa a funçãp para alterar a cor da div do fundo do termometro
        alerta(temperatura_atual); // executa a função que gera o alerta com som
       
        infos_temperatura(temperatura_atual); // executa a função que mostra na tela os textos sobre a temperatura    

    } 
    //document = html, getElementById = pegar o elemento HTML que possua o id, "txt_temperatura" -> nome da ID, innerHTML -> escrever no html, temperatura_atual + "°c" -> escreve a temperatura em atualização
    document.getElementById("txt_temperatura").innerHTML = temperatura_atual + "°c"; //Aqui estamos escrevendo dentro do html onde está marcando a temperatura (dash.html)
    
    if (temperatura_atual < nova_temperatura) { // se a temperatura_atual for menor que a nova_temperatura
        temperatura_atual++; // a temperatura_atual é incrementa de 1 em 1, mesma coisa de temperatura_atual = temperatura_atual + 1; so que com '++' é simplificado isso

    }//fim if
    else if (temperatura_atual > nova_temperatura) { // se a temperatura_atual for maior que a nova_temperatura
        temperatura_atual--;// a temperatura_atual é subtraida de 1 em 1 ate chegar na nova temperatura
    }// fim else if
    
}// fim função para fazer animação de numeros

function redir_page(url) {// função sem nexo por enqt
    
}

function atualiza_fundo_termometro(grau) {// função COM parametro para atualizar o fundo da div de temperatura 
    if (grau < 11) { // se grau for menor q 11

        // * as classes são usadas para que o css consiga aplicar os efeitos

        //busca o elemento que tem "area_termometro"

        document.getElementById("area_termometro").className = ""; //tira todas as CLASSES que tem esse ID referenciado
        document.getElementById("area_termometro").className = "muito_frio"; // adiciona uma CLASSE* nesse ID referenciado
    }
    else if (grau < 21) { // etc
        document.getElementById("area_termometro").className = ""; // tiras todas as classes
        document.getElementById("area_termometro").className = "frio"; // adiciona uma nova classe
    } else if (grau < 31) {
        document.getElementById("area_termometro").className = "";
        document.getElementById("area_termometro").className = "tropical";
    } else {
        document.getElementById("area_termometro").className = "";
        document.getElementById("area_termometro").className = "calor";
    }
}

function alerta(grau) { // função com parametro para gerar um alerta sonoro
    if (grau >= 38 && grau <= 50) { // faz a comparação para saber se a temperatura está em na faixa
       document.getElementById("alerta").play();// busca o tag <audio> no html que possua um id "alerta" -> <audio id="alerta"> e da um play nele
    } else { // se nao estiver nesse periodo
        document.getElementById("alerta").pause(); // busca a tag <audio> que possua o id "alerta" e da um pause
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

function infos_temperatura(temperatura) {//função que adiciona os textos sobre as temperaturas, COM parametro

    vetor_menor_dez = new Array(4); //declara um VETOR de 4 posições
    vetor_menor_dez[0] = "FRIO FRIO FRIO";// na posição 0 recebe esse texto
    vetor_menor_dez[1] = "TEMPERATURA INFERIOR A 10";// na posição 1 recebe esse texto
    vetor_menor_dez[2] = "FRIO FRIO FRIO";//etc
    vetor_menor_dez[3] = "TEMPERATURA INFERIOR A 10";// etc
   

    vetor_onze_vinte = new Array(4);// msm coisa
    vetor_onze_vinte[0] = "MENOS FRIO MENO FRIO";// etc
    vetor_onze_vinte[1] = "TEMPERATURA DE 11 A 20";// etc
    vetor_onze_vinte[2] = "MENOS FRIO MENO FRIO";
    vetor_onze_vinte[3] = "TEMPERATURA DE 11 A 20";

    vetor_vinte1_trinta = new Array(4);// etc
    vetor_vinte1_trinta[0] = "NEM FRIO NEM QUENTE";// etc
    vetor_vinte1_trinta[1] = "TEMPERATURA DE 21 A 30";
    vetor_vinte1_trinta[2] = "NEM FRIO NEM QUENTE";
    vetor_vinte1_trinta[3] = "TEMPERATURA DE 21 A 30";

    vetor_trinta1_quarenta = new Array(4);// etc
    vetor_trinta1_quarenta[0] = "TA ESQUENTANDO TA ESQUENTANDO";// etc
    vetor_trinta1_quarenta[1] = "TEMPERATURA DE 31 A 40";
    vetor_trinta1_quarenta[2] = "TA ESQUENTANDO TA ESQUENTANDO";
    vetor_trinta1_quarenta[3] = "TEMPERATURA DE 31 A 40";

    vetor_quarenta1 = new Array(4);// etc
    vetor_quarenta1[0] = "CHURASQUINHO TA R$ 2 CHURASQUINHO TA R$ 2";// etc
    vetor_quarenta1[1] = "TEMPERATURA SUPERIOR A 41";
    vetor_quarenta1[2] = "CHURASQUINHO TA R$ 2 CHURASQUINHO TA R$ 2";
    vetor_quarenta1[3] = "TEMPERATURA SUPERIOR A 41";

    if (temperatura <= 10) {//se a temperatura estiver menor igual que 10
        for (var i = 0; i < getSizeP(); i++){// cria um laço de retição que será responsavel por apagar todos os textos existentes (aqui usa aquela gambiarra)
            remove_infos();//apaga todos os <p>, toda vez que entrar no laço, ex -> getSizeP retorna 5, então o laço repetira 5 vezes, e a função remove_infos() será executada 5 vezes, por isso eu utilizei o 'p[0]' pois se eu usasse por exemplo 1,2,3 daria erro 'NullException' pois esses numeros correspondente já seriao excluidos, com a posição sempre no 0 é "impossivel" nao existir EU SEI FICOU MTO CONFUSO
        }//fim for
       
        for (var i = 0; i < vetor_menor_dez.length; i++) {// cria um laço para CRIAR os <p> com os textos dos VETORES que criamos acima
            var txt = document.getElementById("textos");//acho q tu já entendeu oq faz aqui, se não entendeu sobe um pouco q la ta explicando
            var p = txt.getElementsByTagName("p");// etc
            txt.innerHTML += "<p id='desc_temp'>" + vetor_menor_dez[i] + "</p>";// aqui usamos novamento o innerHTML, nele criamos os <p> que recebem o conteudo dos vetores, -> [i] representa a posição dele, ao inves de usar o nomeDoVetor[0] usamos o i pois ele esta se alto incrementando de 1 em 1

        }// fim for
        
    } else if (temperatura > 10 && temperatura <= 20) {// faz a mesma coisa, so q aqui é um else if :p
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_onze_vinte.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_onze_vinte[i] + "</p>";

        }
    } else if (temperatura > 20 && temperatura <= 30) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_vinte1_trinta.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_vinte1_trinta[i] + "</p>";

        }
    } else if (temperatura > 30 && temperatura <= 40) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_trinta1_quarenta.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_trinta1_quarenta[i] + "</p>";

        }
    }  else if (temperatura > 40) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_quarenta1.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_quarenta1[i] + "</p>";
        }
    }
    

}

function getValue(id_div) {// função sem nexo dnv 
   // return document.getElementById(id_div).innerHTML.replace('°c', '');
    return (id_div);
}

function getRandom(max) {// função que nao existira mais tarde, ele retorna numeros aleatorios
    Math.floor(Math.random() * max)
}

function atualiza_numeros_medias(menor_antes, menor_nova, media_antes, media_nova, maior_antes, maior_nova) {// função para atualizar os numeros das temperatura medias COM parametros, o funcionamento é igual a primeira função desse arquivo
    temp_menor_atual = menor_antes;
    temp_menor_nova = menor_nova;  

    temp_media_atual = media_antes;
    temp_media_nova = media_nova;

    temp_maior_atual = maior_antes;
    temp_maior_nova = maior_nova;

    atualiza_temp_menor();
    atualiza_temp_media();
    atualiza_temp_maior();
}

function atualiza_temp_menor() {// mesma função para fazer a animação, sem nada de nova a se acrescentar
    if (temp_menor_atual != temp_menor_nova) {
        setTimeout(atualiza_temp_menor, 100);      
    }

    document.getElementById("txt_temp_menor").innerHTML = temp_menor_atual + "°c";

    if (temp_menor_atual < temp_menor_nova) {
        temp_menor_atual++;

    }
    else if (temp_menor_atual > temp_menor_nova) {
        temp_menor_atual--;
    }
}

function atualiza_temp_media() {// mesma coisa, animação de temperatura

    if (temp_media_atual != temp_media_nova) {
        setTimeout(atualiza_temp_media, 100);
    }

    document.getElementById("txt_temp_media").innerHTML = temp_media_atual + "°c";

    if (temp_media_atual < temp_media_nova) {
        temp_media_atual++;

    }
    else if (temp_media_atual > temp_media_nova) {
        temp_media_atual--;
    }
}

function atualiza_temp_maior() {// mesma coisa, animação de temperatura
    if (temp_maior_atual != temp_maior_nova) {
        setTimeout(atualiza_temp_maior, 100);
    }


    document.getElementById("txt_temp_maior").innerHTML = temp_maior_atual + "°c";

    if (temp_maior_atual < temp_maior_nova) {
        temp_maior_atual++;

    }
    else if (temp_maior_atual > temp_maior_nova) {
        temp_maior_atual--;
    }
}


function getViewConfiguracoes(){// função para abrir a tela de configuração, acho q voce ja entendeu como funciona isso, se voce viu os exemplos acima, mas vamos lá
    var div_fundo = document.getElementById("fundo_modal");// adiciona a uma variavel, a referencia que busca a div que possui o ID "fundo modal"
    div_fundo.className = "";// tira todas as classes da div que referenciamos acima
    div_fundo.className = "fundo_modal_on"; //adiciona uma classe para que o css aplique o efeito, no caso para mostrar a tela
}

function removerViewConfiguracoes(){// função para remover a tela de configurações
    var div_fundo = document.getElementById("fundo_modal");// msm coisa
    div_fundo.className = "";//remove as classe
    div_fundo.className = "fundo_modal_off"; //adiciona a classe para esconder a tela, classe adicionada para o css aplicar o efeito
}


function getViewAddArduino(){ // mesma coisa da getViewConfiguracoes
    var div_fundo = document.getElementById("fundo_addArduino");
    div_fundo.className = "";
    div_fundo.className = "fundo_addArduino_on";
}

function removerViewAddArduino(){// mesma coisa da removerViewConfiguracoes
    var div_fundo = document.getElementById("fundo_addArduino");
    div_fundo.className = "";
    div_fundo.className = "fundo_addArduino_off";     
}
