<%-- 
    Document   : deletar
    Created on : 24 de nov. de 2023, 19:46:27
    Author     : marco
--%>

<%@page import="model.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Lavagem"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar lavagem</title>
    </head>
    <body>
        <h1>Lavagens</h1>
        <%
            // Recebendo dados
            int id = (Integer.parseInt(request.getParameter("ident")));

            //Excluir!
            try {
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("delete from lavagens where id = ?");
                comando.setInt(1, id);
                comando.execute();
                con.close();

                //Saída
                out.println("<b> Registro excluído com sucesso! </b>");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }


        %>
    </body>
</html>
