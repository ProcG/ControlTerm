const SerialPort = require('serialport');
const Readline = SerialPort.parsers.Readline;
var temp = 0;


class ArduinoDataRead {

    constructor(){
        this.listData = [];
    }

    get List() {
        return this.listData;

    }

	
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
                
				var a = data.split("-");
				
				console.log(a);
				
				setTemperatura(a[0], a[1]);
				
				
				
				//setTemperatura(parseFloat(data));
				
            });
            
        }).catch(error => console.log(error));
    } 

		
		

	
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
		
	