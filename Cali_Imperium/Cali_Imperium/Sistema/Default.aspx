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
                    <asp:Button Text="Editar" runat="server" ID="btnAtualizarPerfil" OnClick="btnAtualizarPerfil_Click" CssClass="atualizar_perfil"></asp:Button>
                </div>
                <div class="sub_menus">
                    <ul>
                        <li>
                            <asp:HyperLink NavigateUrl="Default.aspx" runat="server" CssClass="links" Text="Início"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="Relatorio/Default.aspx" runat="server" CssClass="links" Text="Relatórios de Temperatura"></asp:HyperLink></li>
                        <li>

                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" onclick="abrirmodal()" Text="Temperaturas Ideais"></asp:HyperLink></li>
                                    <% 

                            Caliimperium.Temperatura t = new Caliimperium.Temperatura();
                            Cali_Imperium.Usuario u = (Cali_Imperium.Usuario)Session["Usuario"];


                            if (t.UsuarioTemArduino(u.ID) == true)
                            {
                        %>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" onclick="getViewAddArduino()" Text="Editar Termometro"></asp:HyperLink>
                        </li>
                        <%}
                            else

                            { %>

                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" onclick="getViewAddArduino()" Text="Adicionar Termometro"></asp:HyperLink>
                        </li>

                        <%} %>

                        <li>
                            <asp:HyperLink NavigateUrl="https://desk.zoho.com/portal/controlterm/home" runat="server" CssClass="links" Text="Suporte" Target="_blank"></asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Ajuda" onclick="getViewFaq()"></asp:HyperLink>
                        </li>
                    </ul>
                    <ul class="sair_site">

                        <li>
                            <asp:HyperLink NavigateUrl="Logout.aspx" runat="server" CssClass="links" Text="Sair" ID="btnSair"></asp:HyperLink></li>
                    </ul>
                </div>
            </div>

            <%


                if (t.UsuarioTemArduino(u.ID) == true)
                {
            %>

            <div class="pos_area_termo" id="pisca">
                <div id="area_termometro">
                    <div id="circ" class="termometro" onclick="att()">
                        <p class="temperatura" id="txt_temperatura">0</p>
                        <p class="ultima_att" id="ult_att"></p>
                    </div>
                    <div id="textos">
                        <canvas id="chart"></canvas>

                    </div>
                </div>
            </div>

            <div class="analytics">
                <div class="medias">
                    <p class="temperatura_medias" id="txtMinima">0</p>
                    <p class="desc_temp">Minima</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txt2Q">0</p>
                    <p class="desc_temp">1º Quartil</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txtMediana">0</p>
                    <p class="desc_temp">Mediana</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txt3Q">0</p>
                    <p class="desc_temp">3º Quartil</p>
                </div>
                <div class="medias">
                    <p class="temperatura_medias" id="txtMaxima">0</p>
                    <p class="desc_temp">Maxima</p>
                </div>
            </div>
            <% }// FIM ID
                else
                {
            %>
            <div class="sem_termometro">
                <asp:Label runat="server" class="txtNaoTem" ID="txtMsgNaoTem"></asp:Label>
            </div>
            <%
                }
            %>
        </div>

        <audio id="alerta" loop>
            <source src="js/bythesword.mp3" type="audio/mp3" />
        </audio>


        <div id="fundo_modal_arduino" class="fundo_modal_arduino_off">

            <% 
                if (t.UsuarioTemArduino(u.ID) == true)
                {
            %>
            <div id='conf_arduino'>
                <p class='titulo'>Editar Termometro</p>
                <%--<input type='text' name='' class='input_padrao' placeholder='Código do termometro'>
                    <input type='text' name='' class='input_padrao' placeholder='Nome de Exibição do Termometro'>--%>
                <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Minima' ID="txtTempMinima" MaxLength="2"></asp:TextBox>
                <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Maxima' ID="txtTempMaxima" MaxLength="2"></asp:TextBox>
                <asp:Button Text="Cancelar" CssClass="cnl" ID="Button1" runat="server" />
                <asp:Button Text="Adicionar" CssClass="adc" ID="btnEditArduino" runat="server" OnClick="btnEditArduino_Click" />
                <a href='#' class='fechar' onclick='removerViewAddArduino()'>x</a>
            </div>
            <% }
            else
            { %>
            <div id='conf_arduino'>
                <p class='titulo'>Adicionar Termometro</p>
                <asp:TextBox runat="server" CssClass='input_padrao' placeholder='Código do termometro' ID="txtNomeArduino"></asp:TextBox>
                <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Minima' ID="txtMinimaC" MaxLength="2"></asp:TextBox>
                <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Maxima' ID="txtMaximaC" MaxLength="2"></asp:TextBox>
                <asp:Button Text="Cancelar" CssClass="cnl" ID="Button2" runat="server" />
                <asp:Button Text="Adicionar" CssClass="adc" ID="btnAddArduino" runat="server" OnClick="btnAddArduino_Click" />
                <a href='#' class='fechar' onclick='removerViewAddArduino()'>x</a>
            </div>
            <%} %>
        </div>

        <div id="fundo_modal_faq" class="fundo_modal_faq_off">

          
            <div id='faq'>
                <p class='titulo'>Olá Bem-Vindo ao FAQ ControlTerm!</p>
                
            <div class="fundo_faq">
                <div class="abrir">
                    <p class="pergunta">Como Cadastrar meu Arduino Uno?</p>
                    <p class="resposta"> 
                       Para cadastrar o Arduino Uno o senhor(a) deve seguir os seguintes passos:<br />
                        1- Vá com o mouse em seu painel esquerdo e clique em "Adicionar Termômetro";<br />
                        2- Clique em Adicionar Termômetro;<br />
                        3- Adicione o Código do Arduino localizado na parte de baixo de sua caixa(Arduino);<br />
                        4- Adicione temperatura Min e Max Desejada;<br />
                        5- Cadastre.
                        
                    </p>
                </div>
            </div>

             <a href='#' class='fechar' onclick='removerViewFaq()'>x</a>
            </div>
               
        </div>


        
            <div id="modal" class="modal_off">
	            <div class="fundo">
		            <a class="btn_fechar" onclick="fecharmodal()">x</a>
			            <div id="tela_ideais">
				            <p class="title">Temperaturas ideais</p>
				            <p class="sub"> Corpo Humano </p>
				            <img src="img/corpo.jpg" class="img_temperatura_ideal">
				            <p class="text">A temperatura normal do corpo varia entre 36,1ºC e 37,2ºC, com oscilações ao longo do dia que normalmente não ultrapassam os 0.6ºC. A temperatura corporal é mais baixa pela manhã, depois aumenta durante o dia e atinge o valor máximo no início da noite.</p>
				
				            <p class="sub"> Ar Condicionado </p>
				            <img src="img/ar_condicionado.jpg" class="img_temperatura_ideal">
				            <p class="text"> A Agência Nacional de Vigilância Sanitária (Anvisa)  com a polêmica. A recomendação do órgão é que a temperatura ar condicionado fique em torno dos 23°C.  </p>				
                        </div>		
	             </div>
            </div>


    </form>

</body>
</html>
<script type="text/javascript" src="js/eventos.js"></script>
<script type="text/javascript" src="js/atualizar.js"></script>
<script>
    var numeros = new Array();

    function att() {
        //°c
        var xhttp = new XMLHttpRequest();

        xhttp.open("GET", "getTemperatura.aspx", true);
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState === xhttp.DONE && xhttp.status === 200) {

                numeros = xhttp.responseText.split("+");

                if (numeros[0] != "") {

                    atualiza_numeros(document.getElementById('txt_temperatura').innerHTML.replace('°c', ''), Math.floor(numeros[0]), Math.floor(numeros[6]), Math.floor(numeros[7]));//numeros[0] == Última temperatura registrada, numeros[6] == Temperatura minima aceitavel, numeros[7] == Temperatura maxima aceitavel
                    Analytics(numeros[1], numeros[2], numeros[3], numeros[4], numeros[5]);

                    var now = new Date();
                    now.format("dd/MM/yyyy HH:mm:ss");
                    alert(now);
                }
            }
        }

        xhttp.send();



    }

    att();
    
    setInterval(() => {
        try {
            att();
        } catch (err) { console.log(err); }
    }, 15000);


</script>
