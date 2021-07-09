package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.*;

public final class ShowAssignedRoom_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("           ");
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
      out.write("</html>\n");
      out.write("\n");
      out.write("           <table>\n");
      out.write("               <tr>\n");
      out.write("                   <th> <a href=\"AssignRoom.jsp\"> Assign new Room</a></th>\n");
      out.write("                   <th><a href=\"ShowRoom.jsp\"> Show rooms</a></th>\n");
      out.write("               </tr>\n");
      out.write("\n");
      out.write("           </table>\n");
      out.write("          \n");
      out.write("           \n");
      out.write("       <table style='boder:2px;'>\n");
      out.write("             <tr>\n");
      out.write("                 <td>Room id</td>\n");
      out.write("                 <td>Room Type</td>\n");
      out.write("                 <td>Patient id</td>\n");
      out.write("                 <td>Patient Name</td>\n");
      out.write("                 <td>Admit id</td>\n");
      out.write("                 <td>Disease</td>\n");
      out.write("                 <td>Doctor id</td>\n");
      out.write("                 <td>Doctor Name</td>\n");
      out.write("                 <td>Active</td>\n");
      out.write("             </tr>            \n");
      out.write("             \n");
      out.write("             ");

            
            ResultSet rs=null;        
                 Connection connection = null;
                PreparedStatement pstatement = null;
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital","root","");
             String queryString1;
            
            
                queryString1 = "SELECT room.rid,room.rtype,patient.pid,patient.name,admit.aid,admit.disease,doctor.did,doctor.name,roomas.arid,roomas.active from patient,admit,doctor,room,roomas where   admit.aid=roomas.aid and doctor.did=roomas.did and patient.pid=admit.pid and room.rid=roomas.rid;";
            
            
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
 out.print(rs.getString("room.rid")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    ");
 out.print(rs.getString("room.rtype")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    ");
 out.print(rs.getString("patient.pid")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                 <td>\n");
      out.write("                                    ");
 out.print(rs.getString("patient.name")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                 <td>\n");
      out.write("                                    ");
 out.print(rs.getString("admit.aid")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                 <td>\n");
      out.write("                                    ");
 out.print(rs.getString("admit.disease")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                                 <td>\n");
      out.write("                                    ");
 out.print(rs.getString("doctor.did")); 
      out.write("\n");
      out.write("                                </td> \n");
      out.write("                                <td>\n");
      out.write("                                    ");
 out.print(rs.getString("doctor.name")); 
      out.write("\n");
      out.write("                                </td>\n");
      out.write("                              \n");
      out.write("                                \n");
      out.write("                                <td><form method='post' action='AssigneroomActive.jsp'>\n");
      out.write("                                         \n");
      out.write("                                         <input type=\"text\" value='");
 out.print(rs.getString("roomas.active")); 
      out.write("' name=\"active\" hidden>\n");
      out.write("                                         <button name='subject' type='submit' value='");
 out.print(rs.getString("arid")); 
      out.write('\'');
      out.write('>');
out.print(rs.getString("roomas.active"));
      out.write("</button>\n");
      out.write("                                     \n");
      out.write("                                     </form> \n");
      out.write("                                 </td>\n");
      out.write("                                \n");
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
