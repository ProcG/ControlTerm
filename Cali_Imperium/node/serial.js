const SerialPort = require('serialport');
const Readline = SerialPort.parsers.Readline;
var temp = 0;

var temperaturas = new Array();

class ArduinoDataRead {

    SetConnection(){

        SerialPort.list().then(listSerialDevices => {
            
            let listArduinoSerial = listSerialDevices.filter(serialDevice => {
                return serialDevice.vendorId == 2341 && serialDevice.productId == 43;
            });
            
            if (listArduinoSerial.length != 1){
                throw new Error("The Arduino was not connected or has many boards connceted");
            }

            console.log("Arduino found in the com %s", listArduinoSerial[0].comName);
             
            return  listArduinoSerial[0].comName;
            
        }).then(arduinoCom => {
            
            let arduino = new SerialPort(arduinoCom, {baudRate: 9600});
            
            const parser = new Readline();
            arduino.pipe(parser);
            
            parser.on('data', (data) => {
                
				
				var leitura_do_arduino = data.split("-");
				//leitura do arduino segue o padrão [(temperatura)-(codigo do arduino)]
				//leitura_do_arduino[0] = temperatura
				//leitura_do_arduino[1] = codigo do arduino
				
				temperaturas.push(leitura_do_arduino[0]);
				console.log(temperaturas.length);
				
				var tempo = 15; 

				if(temperaturas.length == tempo){
					
					var temp_total_soma = 0;
					for(var i = 0; i < tempo; i++){
						temp_total_soma += parseInt(temperaturas[i]);
						//console.log(temp_total_soma+" - media");						
					}
					
					
					var media = temp_total_soma / tempo; 
					
					setTemperatura(media, leitura_do_arduino[1]);
					
				//	notificacao(media, leitura_do_arduino[1]);
					
					temperaturas = new Array();
					
					console.log(media+" - "+leitura_do_arduino [1]);
					console.clear();
				
					
				}
				

				
				
				//setTemperatura(parseFloat(data));
				
            });
            
        }).catch(error => console.log(error));
    } 

		
		

	
}

function notificacao(temperatura, codArduino){
	
	var url = "https://notificacao-controlterm.azurewebsites.net/Default.aspx?cod="+codArduino+"&temperatura="+temperatura;
						
	var request = require('request');
	request(url, function (error, response, body) {
	  if (!error && response.statusCode == 200) {
		return body;//retorna a mensagem do site (da url);
	  }
	});
}


const serial = new ArduinoDataRead();
serial.SetConnection();


		var Connection = require('tedious').Connection;  
		var config = {  
        userName: 'Control',  
        password: 'Term2k18',  
        server: 'controlterm.database.windows.net',  
        // If you are on Azure SQL Database, you need these next options.  
        options: {encrypt: true, database: 'ControlTerm'}  
		};  
		var connection = new Connection(config);  
		connection.on('connect', function(err) {  
			
			if(err){
				console.log("err: "+err);				
			}else{
				console.log("conectado");
			}
			
			// If no error, then good to proceed.  
			    
		});  

		var Request = require('tedious').Request  
		var TYPES = require('tedious').TYPES;  

		function setTemperatura(temp, codigo) {  
			request = new Request("INSERT Into Temperatura (temperatura, codArduino) VALUES (@temp,@cod);", function(err) {  
			 if (err) {  
					console.log(err);
				}  
			});  
			request.addParameter('temp', TYPES.Int, temp);  
			request.addParameter('cod', TYPES.Int, codigo);
			connection.execSql(request);  
		}  
		
	