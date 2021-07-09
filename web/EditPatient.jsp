<%-- 
    Document   : EditPatient
    Created on : Nov 6, 2020, 9:46:13 PM
    Author     : Jetani
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebHos</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <%@include file="Header.jsp" %>
        <%
            Connection connection = null;
            PreparedStatement pstatement = null; 
            ResultSet rs=null; 
             String edid;
             edid=request.getParameter("Patientid");
             
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
             String queryString1;
            
            
                queryString1 = "SELECT * from patient where pid="+edid;
            
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
               while(rs.next())              
                  {
                   %>
        
        <FORM action="" method="post" style="position:relative; top:160px">
            <TABLE class="tab">
                <thead>
                    <tr>
                        <th colspan="2" style="text-align: center; font-size: 18px;">Edit Patient Details</th>
                    </tr>
                </thead>
                <tbody>
                <TR>
                    <TH>Patient ID</TH>
                    <TD><INPUT TYPE="text" readonly value="<% out.print(rs.getString("pid")); %>" NAME="pid"></TD>
                </tr>
                <TR>
                    <TH>Name</TH>
                    <TD><INPUT TYPE="text" value="<% out.print(rs.getString("name")); %>" NAME="name"></TD>
                </tr>
                <TR>
                    <TH>Gender</TH>
                    <% 
                        if(rs.getString("gender").equals("male"))
                            { %>
                    <TD>Male <INPUT TYPE="radio" checked NAME="gender" value="male">
                    Female <INPUT TYPE="radio" NAME="gender" value="female"></TD>
                                <%
                            }
                            else
                            {%>
                    <TD>Male <INPUT TYPE="radio" NAME="gender" value="male">
                                        Female <INPUT TYPE="radio" checked NAME="gender" value="female"></TD>
                            <%}
                    
                    %>)
                </tr>
                <TR>
                    <TH>Age</TH>
                    <TD width="50%"><INPUT TYPE="number" value="<% out.print(rs.getString("age"));%>" NAME="age"></TD>
                </tr>
                 <TR>
                    <TH>Email</TH>
                    <TD><INPUT TYPE="email" value="<% out.print(rs.getString("email"));%>" NAME="email"></TD>
                </tr>
                <TR>
                    <TH>Contact</TH>
                    <TD><INPUT TYPE="text" value="<% out.print(rs.getString("contact"));%>" NAME="contact"></TD>
                </tr>
                 <TR>
                    <TH>Address</TH>
                    <TD><INPUT TYPE="text" value="<% out.print(rs.getString("address"));%>" NAME="address"></TD>
                </tr>
             
              
                <TR>
                    <TD colspan="2" style="text-align: center;"><INPUT TYPE="submit" class="button" VALUE="SUBMIT"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%}
                 String pid = request.getParameter("pid");
                String name = request.getParameter("name");
                String gender = request.getParameter("gender");
                String age = request.getParameter("age");
                String email = request.getParameter("email");
                String contact = request.getParameter("contact");
                String address = request.getParameter("address");
        
         
                
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
              
                int updateQuery = 0;
                if (name != null && address != null) {
                    if (name != "" && address != "") {
                        try {

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            out.print(edid);
                           String queryString="update patient set name='"+name+"',gender='"+gender+"',age="+age+",email='"+email+"',contact='"+contact+"',address='"+address+"' where pid="+pid;                           
                           pstatement = connection.prepareStatement(queryString);                                                  
                           updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {%>
            <TABLE class="tab">
                <tr><th><a href="ShowPatients.jsp">Patient Data Update. Click to go Back</a> </th></tr>            
            </table>

            <%
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

            %>
        </FORM>
        
        
    </body>
</html>