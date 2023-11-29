<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0 auto
            }

            table{
                width:80%;
                border:solid #c0c0c0 1px
            }

            th{
              background-color: black;
              color: white
            }           
            
            th, td{
                padding: 10px;
                border:solid #ededed 1px;
                text-align: center
            }
            
        </style>
    </head>
    <body>
        <%
            String n = request.getParameter("nome");
            
            //Conexão com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Cmtc98290594");
            //Buscar o cursos na tabela do banco de dados
            PreparedStatement st = con.prepareStatement("SELECT * FROM curso WHERE nome LIKE ?");
            st.setString(1, "%" + n + "%");
            ResultSet cursos = st.executeQuery(); //Executa o select da linha anterior
            //Exibir curso por curso até o final
            out.print("<table border=1>");
            out.print("<tr>");
            out.print("<th>Código</th>");
            out.print("<th>Nome</th>");
            out.print("<th>Duração</th>");
            out.print("<th>Período</th>");
            out.print("<th>Exclusão</th>");
            out.print("</tr>");
            while(cursos.next()){
              out.print("<tr>");
              out.print("<td>" + cursos.getString("codigo") + "</td>");
              out.print("<td>" + cursos.getString("nome")+ "</td>");   
              out.print("<td>" + cursos.getString("duracao")+ "</td>");
              out.print("<td>" + cursos.getString("periodo")+ "</td>");
              %>
             <td> <a href="exccur.jsp?codigo=<%=cursos.getString("codigo")%>"> Excluir </a> </td
             <%
              out.print("</tr>");
            }
            out.print("</table>");
        %>
    </body>
</html>

