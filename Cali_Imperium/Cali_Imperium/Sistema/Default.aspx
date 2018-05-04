<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cali_Imperium.Sistema.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TermometrOnline</title>
    <link rel="stylesheet" type="text/css" href="css/inicio.css" />
    <link rel="stylesheet" type="text/css" href="css/padroes.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="http://www.chartjs.org/dist/2.7.1/Chart.js"></script>
    <script src="http://www.chartjs.org/samples/latest/utils.js"></script>


    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="area" id="ar">
            <div class="menu">
                <div class="confs_usuario">
                    <img src="img/usuario.png" class="foto_usuario" />
                    <div>
                        <p class="nome_usuario">
                            <asp:Label Text="" runat="server" ID="NomeUsuario" />
                        </p>
                        <p class="funcao_usuario">Usuário</p>
                    </div>
                </div>
                <div class="sub_menus">
                    <ul>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Relatórios de Temperatura"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Temperaturas Ideais"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Configurações" onclick="getViewConfiguracoes()"></asp:HyperLink></li>
                    </ul>
                    <ul class="sair_site">
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Sair"></asp:HyperLink></li>
                    </ul>
                </div>
            </div>

            <div class="pos_area_termo">
                <div id="area_termometro">
                    <div id="circ" class="termometro" onclick="atualiza_numeros(document.getElementById('txt_temperatura').innerHTML.replace('°c', ''), Math.floor(Math.random() * 50))">
                        <p class="temperatura" id="txt_temperatura"></p>
                        <p class="ultima_att" id="ult_att"></p>
                    </div>
                    <div id="textos">
                        <canvas id="chart"></canvas>
                        <%--<p id="desc_temp">Temperatura ideial para pegar câncer de pele</p>
						<p id="desc_temp">Temperatura ideial para pegar câncer de pele</p>
						<p id="desc_temp">Temperatura ideial para pegar câncer de pele</p>
						<p id="desc_temp">Temperatura ideial para pegar câncer de pele</p>--%>
                    </div>
                </div>
            </div>
        </div>

        <audio id="alerta" loop>
            <source src="js/bythesword.mp3" type="audio/mp3" />
        </audio>

        <div id="fundo_modal" class="fundo_modal_off">
            <div id="tela_confs">
                <p class="titulo">Configurações</p>
                <%-- <a href="#" class="confs_opc" onclick="getViewAddArduino()">Adicionar Termometro</a> --%>
                <a href="#" class="confs_opc">Editar suas Informações</a>
                <a href="#" class="confs_opc">Suporte</a>
                <a href="#" class="confs_opc">Ajuda</a>
                <a href="#" class="fechar" onclick="removerViewConfiguracoes()">x</a>
            </div>

            <%--<div id='fundo_addArduino' class="fundo_addArduino_off">
				<div id='conf_arduino'>
					<p class='titulo'>Adicionar novo Termometro</p>
					<input type='text' name='' class='input_padrao' placeholder='Código do termometro'>
					<input type='text' name='' class='input_padrao' placeholder='Nome de Exibição do Termometro'>
					<input type='text' name='' class='term_input' placeholder='Temperatura Minima'>
					<input type='text' name='' class='term_input' placeholder='Temperatura Maxima'>
					<select>
						<option value="null">Selecione o periodo de atualização</option>
						<option value="10s">10 Segundos</option>
						<option value="30s">30 Segundos</option>
						<option value="1m">1 Minuto</option>
						<option value="3m">3 Minuto</option>
						<option value="5m">5 Minuto</option>
					</select>
					<button class='cnl'>Cancelar</button>
					<button class='adc'>Adicionar</button>
					<a href= '#' class='fechar' onclick='removerViewAddArduino()'>x</a>
				</div>
			</div> --%>
        </div>

</form>
</body>
</html>
<script type="text/javascript" src="js/eventos.js" charset="ISO-8859-1"></script>
