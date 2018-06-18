// txt_temperatura txtMinima txt2Q txtMediana txt3Q txtMaxima

var min = 14;
var max = 25;

function get_data(){

    var http = new XMLHttpRequest();
    http.open('GET', 'http://localhost:3000/api', false);
    http.send(null);        
			
    var obj = JSON.parse(http.responseText);
	
    if (obj.data.length == 0){
        return;
    }else{
		return obj.data;
	}
}

function get_temperatura_atual(array){	
	return Math.floor(array[array.length - 1]);	
	
}
function get_temperatura_maxima(array){
	
	var max = array[0];
	for(var i = 0; i < array.length; i++){
		if(array[i] > max){
			max = array[i];
		}
	}
	
	
	
	return Math.floor(max);
	
}

function get_temperatura_minima(array){
	
	var min = array[0];
	for(var i = 0; i < array.length; i++){
		if(array[i] < min){
			min = array[i];
		}
	}
	
	
	return Math.floor(min);
	
}

function get_primerio_quartil(array){
	
	array.sort();
	
	var mediana = array.length / 2.0;
	var n1q = mediana / 2.0;
	
	
	return Math.floor(array[n1q]);	
		
	
}

function get_terceiro_quartil(array){
	
	array.sort();
	
	var mediana = array.length / 2.0;
	var n1q = mediana / 2.0;
	
	var terceiro = mediana + n1q;
	
	
	return Math.floor(array[terceiro]);	
	
}

function get_mediana(array){
	
	array.sort();
	var mediana = Math.floor(array.length / 2.0);
	
	return Math.floor(array[mediana]);	
	
}

function refresh(){
	
	var array = new Array();
	array = get_data();
	
	var antes = document.getElementById("txt_temperatura").innerHTML.replace("°c","");
	
	Analytics(get_temperatura_minima(array),get_primerio_quartil(array),get_mediana(array),get_terceiro_quartil(array),get_temperatura_maxima(array))

	atualiza_numeros(antes,get_temperatura_atual(array),min,max);
	

	console.log(array[0]);
	
}

refresh();

setInterval(()=>{
	refresh();	
},3000);


function atualiza_limite_alarme(temp_min, temp_max){
	
	min = temp_min;
	max = temp_max();
	
}
