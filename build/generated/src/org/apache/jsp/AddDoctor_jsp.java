package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.*;

public final class AddDoctor_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
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
      out.write("     \n");
      out.write("        <FORM action=\"\" method=\"post\">\n");
      out.write("            <TABLE style=\"background-color: #ECE5B6;\" WIDTH=\"30%\" >\n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Name</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"text\" NAME=\"name\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Gender</TH>\n");
      out.write("                    <TD width=\"50%\">Male<INPUT TYPE=\"radio\" NAME=\"gender\" value=\"male\">\n");
      out.write("                    Female<INPUT TYPE=\"radio\" NAME=\"gender\" value=\"female\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                 <TR>\n");
      out.write("                    <TH width=\"50%\">Email</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"email\" NAME=\"email\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Contact</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"number\" NAME=\"contact\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                 <TR>\n");
      out.write("                    <TH width=\"50%\">address</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"text\" NAME=\"address\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                 <TR>\n");
      out.write("                    <TH width=\"50%\">Expert</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"text\" NAME=\"expert\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Status</TH>\n");
      out.write("                    <TD width=\"50%\">Available<INPUT TYPE=\"radio\"  checked NAME=\"status\" value=\"Available\">\n");
      out.write("                    UnAvailable<INPUT TYPE=\"radio\" NAME=\"status\" value=\"UnAvailable\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Active</TH>\n");
      out.write("                    <TD width=\"50%\">Active<INPUT TYPE=\"radio\"  checked NAME=\"active\" value=\"yes\">\n");
      out.write("                    Deactive<INPUT TYPE=\"radio\" NAME=\"active\" value=\"no\"></TD>\n");
      out.write("                </tr>\n");
      out.write("               \n");
      out.write("               \n");
      out.write("                <TR>\n");
      out.write("                    <TH></TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"submit\" VALUE=\"submit\"></TD>\n");
      out.write("                </tr>\n");
      out.write("            </TABLE>\n");
      out.write("            ");

                String name = request.getParameter("name");
                String gender = request.getParameter("gender");
                String email = request.getParameter("email");
                String contact = request.getParameter("contact");
                String address = request.getParameter("address");
                String expert = request.getParameter("expert");
                String status = request.getParameter("status");
                String active = request.getParameter("active");
                
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                Connection connection = null;
                PreparedStatement pstatement = null;
                int updateQuery = 0;
                if (name != null && address != null) {
                    if (name != "" && address != "") {
                        try {

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
                            
                           
                            String queryString = "INSERT INTO `doctor` (`name`, `gender`,`email`, `contact`,`address`,`expert`,`status`,`active`) VALUES (?,?,?,?,?,?,?,?);";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, name);
                            pstatement.setString(2, gender);
                            pstatement.setString(3, email);
                            pstatement.setString(4, contact);
                            pstatement.setString(5, address);
                            pstatement.setString(6, expert);
                            pstatement.setString(7, status);
                            pstatement.setString(8, active);
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <TABLE style=\"background-color: #E3E4FA;\" WIDTH=\"30%\" border=\"1\">\n");
      out.write("                <tr><th>Doctor Data is inserted successfully in database </th></tr>\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("            ");

                            }
                        } catch (Exception ex) {
                            out.println("Unable to connect to batabase." + ex);
                        } finally {
            // close all the connections.
                            pstatement.close();
                            connection.close();
                        }
                    }
                }
            
      out.write("\n");
      out.write("        </FORM>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
