package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.*;

public final class AssignRoom_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        ");

        Connection connection = null;
                            PreparedStatement pstatement = null; 
                            ResultSet rs=null; 
        
      out.write("\n");
      out.write("       \n");
      out.write("            \n");
      out.write("         <FORM action=\"\" method=\"post\">\n");
      out.write("            <TABLE style=\"background-color: #ECE5B6;\" WIDTH=\"30%\" >\n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Admit Select Patient</TH>\n");
      out.write("                    <TD width=\"50%\">\n");
      out.write("                        <select name=\"aid\">\n");
      out.write("                         ");

                            

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
                            String queryString1 = "SELECT patient.pid,patient.name,admit.aid FROM patient,admit where patient.pid=admit.pid and admit.active='yes';";
                            pstatement = connection.prepareStatement(queryString1);
                            rs=pstatement.executeQuery();      
                             while(rs.next())
                                {
                            
      out.write("\n");
      out.write("                        \n");
      out.write("                            <option value=\"");
 out.print(rs.getString("admit.aid")); 
      out.write("\">[");
 out.print(rs.getString("patient.pid")); 
      out.write(']');
 out.print(rs.getString("patient.name")); 
      out.write("</option>\n");
      out.write("                            ");

                              }  
                            
      out.write("\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </TD>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("               \n");
      out.write("                <TR>\n");
      out.write("                    <TH width=\"50%\">Select Room</TH>\n");
      out.write("                    <TD width=\"50%\">\n");
      out.write("                        <select name=\"rid\">\n");
      out.write("                         ");

                            

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
                            String queryString1s = "SELECT DISTINCT(room.rid),room.rtype from room,roomas where room.rid=(select roomas.rid from roomas where roomas.active ='no') or room.rid!=roomas.rid ";
                            pstatement = connection.prepareStatement(queryString1s);
                            rs=pstatement.executeQuery();      
                             while(rs.next())
                                {
                            
      out.write("\n");
      out.write("                        \n");
      out.write("                            <option value=\"");
 out.print(rs.getString("room.rid")); 
      out.write("\">[");
 out.print(rs.getString("room.rid")); 
      out.write(']');
 out.print(rs.getString("room.rtype")); 
      out.write("</option>\n");
      out.write("                            ");

                              }  
                            
      out.write("\n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                    </TD>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("            \n");
      out.write("\n");
      out.write("                <TR>\n");
      out.write("                    <TH></TH>\n");
      out.write("                    <TD width=\"50%\"><INPUT TYPE=\"submit\" VALUE=\"submit\"></TD>\n");
      out.write("                </tr>\n");
      out.write("            </TABLE>\n");
      out.write("            ");

               
                
                String rid = request.getParameter("rid");
                String aid = request.getParameter("aid");
               
                
                  int updateQuery = 0;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                
                if (rid != null) {
                    if (rid != "" ) {
                        try {
                            
                            
                            
                            String queryString11 = "SELECT * FROM checkup where aid="+aid;
                            pstatement = connection.prepareStatement(queryString11);
                            rs=pstatement.executeQuery();      
                            rs.next();
                            String did= rs.getString("did");
                         
                            
                            
                            String queryString22 = "INSERT INTO `roomas` (`rid`, `aid`,`did`,`active`) VALUES (?,?,?,?);";
                            pstatement = connection.prepareStatement(queryString22);
                            pstatement.setString(1, rid);
                            pstatement.setString(2, aid);
                            pstatement.setString(3, did);
                            pstatement.setString(4,"yes");
                          
                            updateQuery = pstatement.executeUpdate();
                            
                            if (updateQuery != 0) {
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <TABLE style=\"background-color: #E3E4FA;\" WIDTH=\"30%\" border=\"1\">\n");
      out.write("                <tr><th><script>alert(aigned)</script> ");
      if (true) {
        _jspx_page_context.forward("ShowAssignedRoom.jsp");
        return;
      }
      out.write(" </th></tr>\n");
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
