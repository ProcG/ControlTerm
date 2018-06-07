<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_relatorio.aspx.cs" Inherits="Cali_Imperium.Sistema.Relatorio.frm_relatorio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Relatorio</title>
    	<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
			box-sizing: border-box;
		}
		.pagina_relatorio{
			width: 598px;
			min-height: 842px;
			/*background: #ddd;*/
		}
		.cabeca{
			position: absolute;
			width: 595px;
			height: 150px;
			/*background: #8da978;*/
		}
		img{
			width: 100px;
			height: 100px;
			margin: 20px;
			background-size: 100% 100%
		}
		div.dados{
			position: absolute;
			width: 450px;
			height: 150px;
			/*background: #f0f;*/
			right: 0px;
			padding: 15px;

		}
		div.dados p{
			color: #000;
			font-family: "Century Gothic";
			text-align: right;
		}
		div.dados p.email{
			color: #000;
			position: absolute;
			font-family: "Century Gothic";
			right: 15px;
			bottom: 15px;
		}
		div.infos{
			position: absolute;
			width: 595px;
			min-height: 692px;
			/*background: #faa;*/
			top: 150px;
			padding: 10px;
		}
		table{
			position: relative;
			width: 100%;
			text-align: center;	
			color: #000;
			font-family: "Century Gothic";	
			border: solid;
			border-width: 1px;
		}
		td{
			border: solid;
			padding: 10px;
			border-width: 1px;
		}
	</style> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="pagina_relatorio">
		<div class="cabeca">

             <%

                 string email = Request.QueryString["email"];
                 int codUser = int.Parse(Request.QueryString["codUser"]);
                 DateTime data_inicio = DateTime.Parse(Request.QueryString["data_inicio"]);
                 DateTime data_fim = DateTime.Parse(Request.QueryString["data_fim"]);

                 List<Cali_Imperium.Sistema.Relatorio.ModalRelatorio> lista = new Cali_Imperium.Sistema.Relatorio.Relatorio().EntreDatas(codUser, data_inicio, data_fim);
                 DateTime dataEtemp = DateTime.Now;
                 string data = $"{dataEtemp.Day}/{dataEtemp.Month}/{dataEtemp.Year} - {dataEtemp.Hour}:{dataEtemp.Minute}";

                 int minima;
                 int media;
                 int maxima;
                 try {
                     minima = lista.Min((x)=>x.Temperatura);
                     media = (int)lista.Average((x)=>x.Temperatura);
                     maxima = lista.Max((x)=>x.Temperatura);
                 }
                 catch
                 {
                     minima = 0;
                     media = 0;
                     maxima = 0;
                 }


            %>

			<div class="dados">
                <p><% Response.Write(data); %></p>
				<p>Relatorio por periodo</p>
				<p><% Response.Write(email); %></p>
			</div>
			<img src="logo.png">
		</div>

		<div class="infos">
			<table> 
				<tr> 
					<td>Menor temperatura</td>
					<td>Temperatura média</td>
					<td>Maior temperatura</td>
				</tr>
				<tr> 
					<td>
                        <p><% Response.Write(minima); %></p>
					</td>
					<td>
                        <p><% Response.Write(media); %></p>
					</td>
					<td>
                        <p><% Response.Write(maxima); %></p>
					</td>
				</tr>	
			</table>
				
				<br> 
				<br> 
				<br> 

			<table>		

				<tr> 
					<td>Data</td>
					<td>Temperatura</td>
				</tr>

               <%
    try
    {
        foreach (Cali_Imperium.Sistema.Relatorio.ModalRelatorio resul in lista)
        {
            string[] data_split = resul.Data.Split(' ');
                %>
				<tr> 
					<td>
                        <p> <% Response.Write(data_split[0]); %></p>
					</td>
					<td>
                        <p><% Response.Write(resul.Temperatura); %></p>
					</td>
				</tr>
                <%
            }
        }
        catch { }
   
                %>


				
			</table>
		</div>

	</div>
    </form>
</body>
</html>
<script>
window.onload = function(){

		var tr = document.getElementsByTagName("tr");

		for(var i = 0; i < tr.length; i++){

			if(i % 2 == 0){

				tr[i].style.backgroundColor = "#aaa";

			}else{

				tr[i].style.backgroundColor = "#ddd";	

			}

		}


}
</script>
