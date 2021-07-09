package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.*;

public final class AddRoom_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("                    <TH width=\"50%\">Room type</TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"text\" NAME=\"name\"></TD>\n");
      out.write("                </tr>\n");
      out.write("               \n");
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
               
                String active = request.getParameter("active");
                
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                Connection connection = null;
                PreparedStatement pstatement = null;
                int updateQuery = 0;
                if (name != null ) {
                    if (name != "" ) {
                        try {

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
                            
                           
                            String queryString = "INSERT INTO `room` (`rtype`,`active`) VALUES (?,?);";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, name);                            
                            pstatement.setString(2, active);
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
      out.write("\n");
      out.write("            <br>\n");
      out.write("            \n");
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
            
      out.write("  \n");
      out.write("        </FORM>\n");
      out.write("        \n");
      out.write("        <table style='boder:2px;'>\n");
      out.write("             <tr>\n");
      out.write("                 <td>Room id</td>\n");
      out.write("                 <td>Room Type</td>\n");
      out.write("                 <td>Active</td>\n");
      out.write("                 <td>Edit</td>                 \n");
      out.write("             </tr>    \n");
      out.write("        \n");
      out.write("             \n");
      out.write("             ");

            
            ResultSet rs=null;        
             
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
             String queryString1;
            
            
                queryString1 = "SELECT * from room ;";
            
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
             while(rs.next())
                {
                   
      out.write("\n");
      out.write("        \n");
      out.write("                   \n");
      out.write("                       \n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    ");
 out.print(rs.getString("rid")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                 <td>\n");
      out.write("                                    ");
 out.print(rs.getString("rtype")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                \n");
      out.write("                                <td><form method='post' action='RoomActive.jsp'>\n");
      out.write("                                         \n");
      out.write("                                         <input type=\"text\" value='");
 out.print(rs.getString("active")); 
      out.write("' name=\"active\" hidden>\n");
      out.write("                                         <button name='subject' type='submit' value='");
 out.print(rs.getString("rid")); 
      out.write('\'');
      out.write('>');
out.print(rs.getString("active"));
      out.write("</button>\n");
      out.write("                                     \n");
      out.write("                                     </form> \n");
      out.write("                                 </td>\n");
      out.write("                                  <td><form method='post' action='editdoctor.jsp'><button name='doctorid' type='submit' value='");
 out.print(rs.getString("rid")); 
      out.write("'>edit</button></form>\n");
      out.write("                                     </td> \n");
      out.write("                                     \n");
      out.write("                            </tr>\n");
      out.write("                       \n");
      out.write("                            \n");
      out.write("                           \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("        ");
            
                } 
            
           
        
      out.write("\n");
      out.write("         </table>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
