<%-- 
    Document   : formulario
    Created on : 28/03/2016, 20:42:32
    Author     : Vini
--%>

<%@page import="br.edu.ifsul.dao.EstadoDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="estadoDao" scope="session" type="EstadoDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Editar estado</title>
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
        <h1>Editar estado</h1>
        <h2><%=estadoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletEstado" method="POST">
            <input id="acao" name="acao" type="hidden">

                      Id:<input type="text" name="id" value="<%= estadoDao.getObjetoSelecionado().getId() == null ? ""
                    : estadoDao.getObjetoSelecionado().getId()%>" readonly size="6">
                        Nome:<input type="text" name="nome" value="<%= estadoDao.getObjetoSelecionado().getNome() == null ? ""
                      : estadoDao.getObjetoSelecionado().getNome()%>"  size="40">
                      UF:<input type="text" name="uf" value="<%= estadoDao.getObjetoSelecionado().getUf() == null ? ""
                    : estadoDao.getObjetoSelecionado().getUf()%>"  size="2">

            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
        </form>
    </body>
</html>
