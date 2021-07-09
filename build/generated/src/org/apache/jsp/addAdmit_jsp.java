package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.*;

public final class addAdmit_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Header.jsp");
  }

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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>WebHos</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\" dir=\"ltr\">\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <title>WebHos</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    <div class=\"detail\">\n");
      out.write("      info@webhos.com &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  +91-8888888888\n");
      out.write("    </div>\n");
      out.write("    <nav>\n");
      out.write("        <div class=\"logo\">\n");
      out.write("          <a href=\"#\">WebHos</a>\n");
      out.write("        </div>\n");
      out.write("          <ul class=\"menu_links\">\n");
      out.write("              <li><a href=\"indexs.jsp\">Home</a></li>\n");
      out.write("              <li><a href=\"ShowPatients.jsp\">Patients details</a></li>\n");
      out.write("              <li><a href=\"ShowAssignedRoom.jsp\">Rooms</a></li>\n");
      out.write("              <li><a href=\"finallist.jsp\">Treatment List</a></li>\n");
      out.write("              <li><a href=\"ShowDoctor.jsp\">Doctor List</a></li>\n");
      out.write("          </ul>\n");
      out.write("    </nav>\n");
      out.write("    <div class=\"footer\">\n");
      out.write("      <li>19MCA004 Hitesh Jarwani</li>\n");
      out.write("      <li>19MCA008 Jainish Jetani</li>\n");
      out.write("    </div>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!--<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"indexs.jsp\">Home</a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"ShowPatients.jsp\">Patients</a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"ShowAssignedRoom.jsp\">admit rooms</a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"finallist.jsp\">Treatment List </a>\n");
      out.write("                </td>\n");
      out.write("                <td>\n");
      out.write("                    <a href=\"ShowDoctor.jsp\">Doctors</a>\n");
      out.write("                </td>\n");
      out.write("                \n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>-->\n");
      out.write("\n");
      out.write("        ");

            Connection connection = null;
            PreparedStatement pstatement = null; 
            ResultSet rs=null; 
                
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
            String queryString1 = "SELECT * FROM patient ORDER BY pid DESC;";
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();      
            rs.next();
            String pid= rs.getString("pid");
            String pname= rs.getString("name");
            
            System.out.print(pid);
            System.out.print(pname);
            
            
      out.write("\n");
      out.write("            \n");
      out.write("            <FORM action=\"\" method=\"post\" style=\"position:relative; top:180px;\">\n");
      out.write("            <TABLE class=\"tab\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\" style=\"text-align: center; font-size: 18px;\">Admit Details</td>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                <TR>\n");
      out.write("                    <TH>Patient</TH>\n");
      out.write("                    <TD><INPUT TYPE=\"text\" value=' ");
      out.print( pname );
      out.write("' readonly NAME=\"name\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("               \n");
      out.write("                <TR>\n");
      out.write("                    <TH>Disease</TH>\n");
      out.write("                    <TD><INPUT TYPE=\"text\" NAME=\"disease\" placeholder=\"Disease\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TH>Doctor</TH>\n");
      out.write("                    <TD>\n");
      out.write("                        <select name=\"doctor\">\n");
      out.write("                            \n");
      out.write("                            ");

                                

                
                            Class.forName("com.mysql.jdbc.Driver");
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            String queryString2 = "SELECT * from Doctor;";
                            pstatement = connection.prepareStatement(queryString2);
                            rs=pstatement.executeQuery();   
                             while(rs.next())
                                {              
      out.write("               \n");
      out.write("                                   \n");
      out.write("                                <option value=\"");
 out.print(rs.getString("did"));
      out.write("\">  ");
 out.print(rs.getString("name")); 
      out.write(" </option>\n");
      out.write("                              \n");
      out.write("                                    \n");
      out.write("                             ");
  } 
      out.write("\n");
      out.write("                           \n");
      out.write("                                    \n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                           \n");
      out.write("                        </select>\n");
      out.write("                    </TD>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <TR>\n");
      out.write("                    <TH>Admit date</TH>\n");
      out.write("                    <TD><INPUT TYPE=\"date\" NAME=\"adate\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TH>Leave Date</TH>\n");
      out.write("                    <TD><INPUT TYPE=\"text\" NAME=\"ldate\"></TD>\n");
      out.write("                </tr>\n");
      out.write("               <TR>\n");
      out.write("                    <TH>Active</TH>\n");
      out.write("                    <TD>Active <INPUT TYPE=\"radio\"  checked NAME=\"active\" value=\"yes\">\n");
      out.write("                    Deactive <INPUT TYPE=\"radio\" NAME=\"active\" value=\"no\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                <TR>\n");
      out.write("                    <TD colspan=\"2\" style=\"text-align: center\"><INPUT class=\"button\" TYPE=\"submit\" VALUE=\"SUBMIT\"></TD>\n");
      out.write("                </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </TABLE>\n");
      out.write("            ");

               
                
                String disease = request.getParameter("disease");
                String adate = request.getParameter("adate");
                String ldate = request.getParameter("ldate");
                String active = request.getParameter("active");
                String doctorid = request.getParameter("doctor");
                
                
                  int updateQuery = 0;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                
                if (disease != null) {
                    if (disease != "" ) {
                        try {
                            
                            String queryString = "INSERT INTO `admit` (`pid`, `disease`,`adate`, `ldate`,`active`) VALUES (?,?,?,?,?);";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, pid);
                            pstatement.setString(2, disease);
                            pstatement.setString(3, adate);
                            pstatement.setString(4, ldate);
                            pstatement.setString(5, active);
                            
                            updateQuery = pstatement.executeUpdate();
                            
                            String queryString11 = "SELECT * FROM admit ORDER BY aid DESC;";
                            pstatement = connection.prepareStatement(queryString11);
                            rs=pstatement.executeQuery();      
                            rs.next();
                            String aid= rs.getString("aid");
                            
                            String queryString22 = "INSERT INTO `checkup` (`aid`, `did`,`active`) VALUES (?,?,?);";
                            pstatement = connection.prepareStatement(queryString22);
                            pstatement.setString(1, aid);
                            pstatement.setString(2, doctorid);
                            pstatement.setString(3,"yes");
                          
                            updateQuery = pstatement.executeUpdate();
                            
                            if (updateQuery != 0) {
      out.write("\n");
      out.write("                             ");
      if (true) {
        _jspx_page_context.forward("ShowPatients.jsp");
        return;
      }
      out.write("\n");
      out.write("                            ");

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
