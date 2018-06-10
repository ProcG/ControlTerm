<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Cali_Imperium.Sistema.Relatorio.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Relatórios | Cali Imperium</title>
    <link rel="stylesheet" type="text/css" href="../css/inicio.css" />
    <link rel="stylesheet" type="text/css" href="../css/padroes.css" />
    <link rel="stylesheet" type="text/css" href="../css/relatorio.css" />


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
                    <asp:Button Text="Editar" runat="server" ID="btnAtualizarPerfil" CssClass="atualizar_perfil"></asp:Button>
                </div>
                <div class="sub_menus">
                    <ul>
                        <li>
                            <asp:HyperLink NavigateUrl="../Default.aspx" runat="server" CssClass="links" Text="Início"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="Default.aspx" runat="server" CssClass="links" Text="Relatórios de Temperatura"></asp:HyperLink></li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Temperaturas Ideais"></asp:HyperLink></li>
                        <% 

                                        Caliimperium.Temperatura t = new Caliimperium.Temperatura();
                                        Cali_Imperium.Usuario u = (Cali_Imperium.Usuario)Session["Usuario"];


                        if (t.UsuarioTemArduino(u.ID) == false)
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
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Suporte"></asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink NavigateUrl="#" runat="server" CssClass="links" Text="Ajuda"></asp:HyperLink>
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
            <div class="area_relatorios">

                <div class="relatorios">
                    <div class="opcoes_relatorios">
                        <a href="" class="opc_relat">Por data</a>
                        <%--<a href="" class="opc_relat">Media por data</a>
                        <a href="" class="opc_relat">Maxima por data</a>
                        <a href="" class="opc_relat">Minima por data</a>--%>
                    </div>

                    <asp:Calendar ID="data_minima" runat="server" CssClass="calendario" CellPadding="5" DayStyle-CssClass="dias_do_mes" OtherMonthDayStyle-CssClass="test" DayHeaderStyle-CssClass="nome_dias" NextPrevStyle-CssClass="prox_mes" SelectedDayStyle-CssClass="dia_selecionado"></asp:Calendar>
                    <asp:Calendar ID="data_maxima" runat="server" CssClass="calendario" CellPadding="5" DayStyle-CssClass="dias_do_mes" OtherMonthDayStyle-CssClass="test" DayHeaderStyle-CssClass="nome_dias" NextPrevStyle-CssClass="prox_mes" SelectedDayStyle-CssClass="dia_selecionado"></asp:Calendar>
                    <asp:Button Text="Gerar" runat="server" ID="btnGerarPorData" OnClick="btnGerarPorData_Click" CssClass="btn" />

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
                <asp:Button Text="Adicionar" CssClass="adc" ID="btnEditArduino" runat="server" />
                <a href='#' class='fechar' onclick='removerViewAddArduino()'>x</a>
            </div>
            <% } else{ %>
            <div id='conf_arduino'>
                <p class='titulo'>Adicionar Termometro</p>
                <asp:TextBox runat="server" CssClass='input_padrao' placeholder='Código do termometro' ID="txtNomeArduino"></asp:TextBox>
                <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Minima' ID="txtMinimaC" MaxLength="2"></asp:TextBox>
                <asp:TextBox runat="server" CssClass="term_input" placeholder='Temperatura Maxima' ID="txtMaximaC" MaxLength="2"></asp:TextBox>
                <asp:Button Text="Cancelar" CssClass="cnl" ID="Button2" runat="server" />
                <asp:Button Text="Adicionar" CssClass="adc" ID="btnAddArduino" runat="server" />
                <a href='#' class='fechar' onclick='removerViewAddArduino()'>x</a>
            </div>
            <%} %>
        </div>


    </form>

</body>
</html>
