<%-- 
    Document   : formulario
    Created on : 28/03/2016, 20:42:32
    Author     : Vini
--%>


<%@page import="br.edu.ifsul.modelo.Marca"%>
<%@page import="br.edu.ifsul.dao.MarcaDAO"%>
<%@page import="br.edu.ifsul.dao.AutomovelDAO"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="marcaDao" scope="session" type="MarcaDAO"/>
<jsp:useBean id="automovelDao" scope="session" type="AutomovelDAO"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Editar automovel</title>
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
        <h1>Editar automovel</h1>
        <h2><%=automovelDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletAutomovel" method="POST">
            <input id="acao" name="acao" type="hidden">

                Id:<input type="text" name="id" value="<%=automovelDao.getObjetoSelecionado().getId() == null ? ""
                        : automovelDao.getObjetoSelecionado().getId()%>" readonly size="6"><br>
                Modelo:<input type="text" name="modelo" value="<%=automovelDao.getObjetoSelecionado().getModelo()== null ? ""
                        : automovelDao.getObjetoSelecionado().getModelo()%>"  size="40"><br>
                Marca:
                <select id="idMarca" name="idMarca">
                <% for (Marca  m : marcaDao.getLista()) { 
                    String selected = "";
                    if(automovelDao.getObjetoSelecionado().getMarca()!=  null){
                        selected = automovelDao.getObjetoSelecionado().getMarca().getId().equals(m.getId()) 
                                ? "selected" : " " ;
                    }
                %>
                <option value="<%=m.getId()%>" <%=selected%> ><%=m.getNome()%></option>
                <% }%>
                </select><br>

                Ano:<input type="number" required="required" name="ano" value="<%=automovelDao.getObjetoSelecionado().getAno()== null ? ""
                        : automovelDao.getObjetoSelecionado().getAno()%>"  size="40"><br>
                Estado atual:<input type="text" name="estado_atual" value="<%= automovelDao.getObjetoSelecionado().getEstadoAtual()== null ? ""
                        : automovelDao.getObjetoSelecionado().getEstadoAtual()%>"  size="40"><br>
                KMs:<input type="number" required="required" name="km" value="<%=automovelDao.getObjetoSelecionado().getQuilometragem()== null ? ""
                        : automovelDao.getObjetoSelecionado().getQuilometragem()%>"  size="40"><br>
                

            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
        </form>
    </body>
</html>
