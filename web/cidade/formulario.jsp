<%-- 
    Document   : formulario
    Created on : 28/03/2016, 20:42:32
    Author     : Vini
--%>

<%@page import="br.edu.ifsul.modelo.Estado"%>
<%@page import="br.edu.ifsul.dao.CidadeDAO"%>
<%@page import="br.edu.ifsul.dao.EstadoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cidadeDao" scope="session" type="CidadeDAO"/>
<jsp:useBean id="estadoDao" scope="session" type="EstadoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Editar cidade</title>
    </head>
    <script>
        function doSalvar() {
            document.getElementById("acao").value = 'salvar';
            document.getElementById("form").submit();
        }
        function doCancelar() {
            document.getElementById("acao").value = 'cancelar';
            document.getElementById("form").submit();
        }
    </script>
    <body>
        <h1>Editar cidade</h1>
        <h2><%=cidadeDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletCidade" method="POST">
            <input id="acao" name="acao" type="hidden">

                Id:<input type="text" name="id" value="<%= cidadeDao.getObjetoSelecionado().getId() == null ? ""
                        : cidadeDao.getObjetoSelecionado().getId()%>" readonly size="6">
                Nome:<input type="text" name="nome" value="<%= cidadeDao.getObjetoSelecionado().getNome() == null ? ""
                          : cidadeDao.getObjetoSelecionado().getNome()%>"  size="40">
                UF:
                <select id="idEstado" name="idEstado">
                <% for (Estado  e : estadoDao.getLista()) { 
                    String selected = "";
                    if(cidadeDao.getObjetoSelecionado().getEstado() !=  null){
                        selected = cidadeDao.getObjetoSelecionado().getEstado().getId().equals(e.getId()) 
                                ? "selected" : " " ;
                    }
                %>
                <option value="<%=e.getId()%>" <%=selected%> ><%=e.getNome()%></option>
                <% }%>
                </select>

            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
        </form>
    </body>
</html>
