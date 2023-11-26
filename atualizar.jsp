<%-- 
    Document   : atualizar
    Created on : 24 de nov. de 2023, 19:43:34
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
        <title>Atualização</title>
    </head>
    <body>
        <h1>Atualizar Lavagem</h1>
        <%
            // Recebendo dados
            
            int id = (Integer.parseInt(request.getParameter("ident")));                     
            
            //Consultar
            try{
                Connection con = Conexao.getConexao();
                PreparedStatement comando = con.prepareStatement("select * from lavagens where id = ?");
                comando.setInt(1, id);
                ResultSet rs = comando.executeQuery();
                
                //Saída
                while (rs.next()){
        %>        
        
              <form method="post" action="executar_atualizar.jsp">
                  Identificação: <input type="text" name="ident" readonly="true" value="<%= rs.getInt("id") %>"> <p>
                  Nome: <input type="text" name="nome" value="<%= rs.getString("nome") %>"> <p>
                  Sobrenome: <input type="text" name="sobrenome" value="<%= rs.getString("sobrenome") %>"> <p>
                  Carro: <input type="text" name="carro" value="<%= rs.getString("carro") %>"><p>
                  Placa: <input type="number" name="placa" value="<%= rs.getInt("placa") %>"><p>
                  Tipo:<input type="text" name="tipo" value="<%= rs.getString("tipo") %>"><p>
                 
                  <input type="submit" name="salvar" value="Salvar">
              </form>
        <%
                }                                        
                con.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }            
        %>
    </body>
</html>
