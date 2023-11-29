<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Receber os dados alterados do formul�rio carregarcurso
            String c, n, d, p;
            c = request.getParameter("codigo");
            n = request.getParameter("nome");
            d = request.getParameter("duracao");
            p = request.getParameter("periodo");
            //Conectar ao banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Cmtc98290594");
            //Fazer update dos dados recebidos para a tabela curso
            PreparedStatement st = con.prepareStatement("UPDATE curso SET nome=?, duracao=?, periodo=? WHERE codigo=?");
            st.setString(1, n);
            st.setString(2, d);
            st.setString(3, p);    
            st.setString(4, c);   
            st.executeUpdate();
            out.print("Os dados do curso " + c + " foram alterados");
            %>
    </body>
</html>
