<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getTemperatura.aspx.cs" Inherits="Cali_Imperium.Sistema.getTemperatura" %>

<% Cali_Imperium.Usuario a = (Cali_Imperium.Usuario)Session["Usuario"]; if (a == null) { Response.Redirect("../TelaLogin/Login.aspx"); } %>

<%=new Caliimperium.Temperatura().PegarTemperatura(a.ID)+"-"%>
0-<%//=new Caliimperium.Temperatura().PegarTempMinima()+"-"%>
0-<%//=new Caliimperium.Temperatura().Pegar2Quartil()+"-"%>
0-<%//=new Caliimperium.Temperatura().PegarMediana(a.ID)+"-"%>
0-<%//=new Caliimperium.Temperatura().Pegar3Quartil()+"-"%>
0-<%//=new Caliimperium.Temperatura().PegarTempMaxima()+"-"%>

