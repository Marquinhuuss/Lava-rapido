<%-- 
    Document   : consulta
    Created on : 24 de nov. de 2023, 19:34:50
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
        <title>Listar lavagem</title>
    </head>
    <body>
        <h1>Lavagem</h1>
        <%
            

            int id = (Integer.parseInt(request.getParameter("ident")));

            
            try {
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("select * from lavagens where id = ?");
                comando.setInt(1, id);
                ResultSet rs = comando.executeQuery();

                //Saída
                while (rs.next()) {
                    out.println("<b> Lavagem</b>");
                    out.println("<br> Identificação: " + rs.getInt("id"));
                    out.println("<br> Nome: " + rs.getString("nome"));
                    out.println("<br> Sobrenome: " + rs.getString("sobrenome"));
                    out.println("<br> Carro: " + rs.getString("carro"));
                    out.println("<br> Placa: " + rs.getString("placa"));
                    out.println("<br> Tipo: " + rs.getString("tipo"));
                    
                }

                con.close(); //fecha                
            } catch (Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }


        %>
    </body>
</html>