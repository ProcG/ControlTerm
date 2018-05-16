<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getTemperatura.aspx.cs" Inherits="Cali_Imperium.Sistema.getTemperatura" %>

<% Cali_Imperium.Usuario a = (Cali_Imperium.Usuario)Session["Usuario"]; if (a == null) { Response.Redirect("../TelaLogin/Login.aspx"); } %>

<%=new Caliimperium.Temperatura().PegarTemperatura(a.ID)+"-"%>
<%=new Caliimperium.Temperatura().PegarTempMinima()+"-"%>
<%=new Caliimperium.Temperatura().Pegar2Quartil()+"-"%>
<%=new Caliimperium.Temperatura().PegarMediana()+"-"%>
<%=new Caliimperium.Temperatura().Pegar3Quartil()+"-"%>
<%=new Caliimperium.Temperatura().PegarTempMaxima()+"-"%>

