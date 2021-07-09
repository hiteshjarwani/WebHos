<%-- 
    Document   : AddDoctor
    Created on : Nov 5, 2020, 8:33:55 PM
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
        <FORM action="" method="post" style="position:relative; top:180px;">
            <TABLE class="tab">
                <thead>
                    <tr>
                        <td colspan="2" style="text-align: center; font-size: 18px;">Doctor Details</td>
                    </tr>
                </thead>
                <tbody>
                <TR>
                    <TH>Name</TH>
                    <TD><INPUT TYPE="text" NAME="name" placeholder="Name"></TD>
                </tr>
                <TR>
                    <TH>Gender</TH>
                    <TD>Male <INPUT TYPE="radio" NAME="gender" value="male">
                    Female <INPUT TYPE="radio" NAME="gender" value="female"></TD>
                </tr>
                 <TR>
                    <TH>Email ID</TH>
                    <TD><INPUT TYPE="email" NAME="email" placeholder="Email ID"></TD>
                </tr>
                <TR>
                    <TH>Contact No.</TH>
                    <TD><INPUT TYPE="number" NAME="contact" placeholder="Contact No."></TD>
                </tr>
                 <TR>
                    <TH>Address</TH>
                    <TD><INPUT TYPE="text" NAME="address" placeholder="Address"></TD>
                </tr>
                 <TR>
                    <TH>Expertise</TH>
                    <TD><INPUT TYPE="text" NAME="expert" placeholder="Expertise"></TD>
                </tr>
                <TR>
                    <TH>Status</TH>
                    <TD>Available <INPUT TYPE="radio"  checked NAME="status" value="Available">
                    Unavailable <INPUT TYPE="radio" NAME="status" value="UnAvailable"></TD>
                </tr>
                <TR>
                    <TH>Active</TH>
                    <TD>Active <INPUT TYPE="radio"  checked NAME="active" value="yes">
                    Deactive <INPUT TYPE="radio" NAME="active" value="no"></TD>
                </tr>
               
               
                <TR>
                    <TD colspan="2" style="text-align: center;"><INPUT  class="button" TYPE="submit" VALUE="SUBMIT"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%
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

                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            
                           
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
                            if (updateQuery != 0) {%>
            <br>
            <TABLE class="tab">
                <tr><th><a href="ShowDoctor.jsp"> Doctor Data is Added. Click to go Back</a> </th></tr>
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
