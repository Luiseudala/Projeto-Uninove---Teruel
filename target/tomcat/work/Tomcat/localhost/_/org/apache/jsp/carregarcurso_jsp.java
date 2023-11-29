/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-11-29 17:50:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public final class carregarcurso_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            //Recebe o código digitada do forme altcur
            String c;
            c = request.getParameter("codigo");
            //Conexão com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "Cmtc98290594");
            //Buscar o cursos na tabela do banco de dados
            PreparedStatement st = con.prepareStatement("SELECT * FROM curso WHERE codigo = ?");
            st.setString(1, c);
            ResultSet curso = st.executeQuery(); //Executa o select da linha anterior
            //Checar se o curso foi encontrado
            if(curso.next()){
            //Carregar o curso em um form html
                String periodo = curso.getString("periodo");
            
      out.write("\n");
      out.write("            <form method=\"post\" action=\"altcur.jsp\">\n");
      out.write("            <p>\n");
      out.write("           <label for=\"cod\">Código:</label>\n");
      out.write("           <input id=\"cod\" type=\"text\" name=\"codigo\" size=\"6\" maxlength=\"6\" required readonly value=\"");
      out.print( curso.getString("codigo") );
      out.write("\">  \n");
      out.write("        </p>\n");
      out.write("        <p>\n");
      out.write("            <label for=\"nom\">Nome do curso:</label>\n");
      out.write("            <input id=\"nom\" type=\"text\" name=\"nome\" size=\"50\" maxlength=\"50\" required value=\"");
      out.print( curso.getString("nome") );
      out.write("\">  \n");
      out.write("         </p>\n");
      out.write("         <p>\n");
      out.write("            <label for=\"dur\">Duração:</label>\n");
      out.write("            <input id=\"dur\" type=\"text\" name=\"duracao\" size=\"15\" maxlength=\"15\" value=\"");
      out.print( curso.getString("duracao") );
      out.write("\">  \n");
      out.write("         </p>\n");
      out.write("         <p>\n");
      out.write("            <label for=\"per\">Período:</label>\n");
      out.write("            <select id=\"per\" name=\"periodo\">\n");
      out.write("                <option value=\"Diurno\">Manhã</option>\n");
      out.write("                <option value=\"Noturno\">Noite</option>                \n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <input type=\"hidden\" id=\"periodo\" value=\"");
      out.print( periodo );
      out.write("\" />\n");
      out.write("         </p>\n");
      out.write("         <p>\n");
      out.write("            <input type=\"submit\" value=\"Salvar Alterações\">\n");
      out.write("         </p>\n");
      out.write("\n");
      out.write("         <script>\n");
      out.write("            const periodo = document.getElementById('periodo');\n");
      out.write("            const periodoCombobox = document.getElementById('per');\n");
      out.write("\n");
      out.write("            window.onload = function() {\n");
      out.write("                for (var i = 0; i < periodoCombobox.options.length; i++) {\n");
      out.write("                    const option = periodoCombobox.options[i];\n");
      out.write("                    if (option.value === periodo.value) {\n");
      out.write("                        periodoCombobox.selectedIndex = i;\n");
      out.write("                        break;\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            };\n");
      out.write("         </script>\n");
      out.write("        </form>\n");
      out.write("            ");

            } else { //se não for encontrado
              out.print("Curso não encontrado");
            }
            
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}