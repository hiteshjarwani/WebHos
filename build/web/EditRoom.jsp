<%-- 
    Document   : EditRoom
    Created on : Nov 6, 2020, 10:42:01 PM
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
             edid=request.getParameter("roomid");
             
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
             String queryString1;
            
            
                queryString1 = "SELECT * from room where rid="+edid;
            
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
               while(rs.next())              
                  {
                   %>
        
        <FORM action="" method="post">
            <TABLE class="tab">
                <thead>
                    <tr>
                        <td colspan="2" style="text-align: center; font-size: 18px;">Room Details</td>
                    </tr>
                </thead>
                <tbody>
                <TR>
                    <TH>ID</TH>
                    <TD><INPUT TYPE="text" readonly value="<% out.print(rs.getString("rid")); %>" NAME="rid"></TD>
                </tr>
                <TR>
                    <TH>Name</TH>
                    <TD><INPUT TYPE="text" value="<% out.print(rs.getString("rtype")); %>" NAME="rtype"></TD>
                </tr>
                <TR>
                    
             
              
                <TR>
                    <TD colspan="2" style="text-align: center"><INPUT TYPE="submit" VALUE="SUBMIT" class="button"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%}
                 String rid = request.getParameter("rid");
                String name = request.getParameter("rtype");
                
                
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
              
                int updateQuery = 0;
                if (name != null ) {
                    if (name != "" ) {
                        try {

                           connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            out.print(edid);
                           String queryString="update room set rtype='"+name+"'where rid="+rid;                           
                           pstatement = connection.prepareStatement(queryString);                                                  
                           updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {%>
            <TABLE class="tab">
                <tbody>
                <tr><th><a href="ShowRoom.jsp">Room Data Updated. Click to go Back</a> </th></tr></tbody>
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