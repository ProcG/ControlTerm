<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getTemperatura.aspx.cs" Inherits="Cali_Imperium.Sistema.getTemperatura" %>

<% Cali_Imperium.Usuario a = (Cali_Imperium.Usuario)Session["Usuario"]; if (a == null) { Response.Redirect("../TelaLogin/Login.aspx"); } %>
<% try{ %>
<%=new Caliimperium.Temperatura().PegarTemperatura(a.ID)+"+"%>
<%=new Caliimperium.Temperatura().PegarTempMinima(a.ID)+"+"%>
<%=new Caliimperium.Temperatura().Pegar2Quartil(a.ID)+"+"%>
<%=new Caliimperium.Temperatura().PegarMediana(a.ID)+"+"%>
<%=new Caliimperium.Temperatura().Pegar3Quartil(a.ID)+"+"%>
<%=new Caliimperium.Temperatura().PegarTempMaxima(a.ID)+"+"%>
<%=Caliimperium.Temperatura.PegarMinima(a.ID)+"+"%>
<%=Caliimperium.Temperatura.PegarMaxima(a.ID)+"+"%>
<% }catch{ Response.Write("error"); } %>

