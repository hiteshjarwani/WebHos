<%-- 
    Document   : AddRoom
    Created on : Nov 6, 2020, 10:08:31 PM
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
        <FORM action="" method="post">
            <TABLE class="tab">
                <thead>
                    <tr>
                        <td colspan="2" style="text-align: center; font-size: 18px;">Room Details</td>
                    </tr>
                </thead>
                <tbody>
                <TR>
                    <TH>Room type</TH>
                    <TD><INPUT TYPE="text" NAME="name" placeholder="Room Type Name"></TD>
                </tr>
               
                <TR>
                    <TH>Status</TH>
                    <TD>Active <INPUT TYPE="radio"  checked NAME="active" value="yes">
                    Deactive <INPUT TYPE="radio" NAME="active" value="no"></TD>
                </tr>
               
               
                <TR>
                    <TH></TH>
                    <TD colspan="2" style="text-align: center;"><INPUT TYPE="submit" class="button" VALUE="SUBMIT"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%
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

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            
                           
                            String queryString = "INSERT INTO `room` (`rtype`,`active`) VALUES (?,?);";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, name);                            
                            pstatement.setString(2, active);
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {%>
            <TABLE class="tab">
                <tr><th><a href="ShowRoom.jsp"> Room Added. Click to go back </a> </th></tr>
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

