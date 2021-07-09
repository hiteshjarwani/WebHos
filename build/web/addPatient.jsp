<%-- 
    Document   : addPatient
    Created on : Nov 5, 2020, 10:42:13 AM
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
                        <th colspan="2" style="text-align: center; font-size: 18px;">Add Patient</th>
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
                    <TH>Age</TH>
                    <TD><INPUT TYPE="number" NAME="age" placeholder="Age"></TD>
                </tr>
                <TR>
                    <TH >Email ID</TH>
                    <TD ><INPUT TYPE="email" NAME="email" placeholder="Email ID"></TD>
                </tr>
                <TR>
                    <TH >Contact No.</TH>
                    <TD ><INPUT TYPE="text" NAME="contact" placeholder="Contact No."></TD>
                </tr>
                <TR>
                    <TH >Address</TH>
                    <TD ><INPUT TYPE="text" NAME="address" placeholder="Address"></TD>
                </tr>
               

                <TR>
                    <TD colspan="2" style="text-align: center;"><INPUT  TYPE="submit" VALUE="SUBMIT" class="button"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%
                String name = request.getParameter("name");
                String gender = request.getParameter("gender");
                String email = request.getParameter("email");
                String age = request.getParameter("age");
                String contact = request.getParameter("contact");
                String address = request.getParameter("address");
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                Connection connection = null;
                PreparedStatement pstatement = null;
                int updateQuery = 0;
                if (name != null && address != null) {
                    if (name != "" && address != "") {
                        try {

                            Class.forName("com.mysql.jdbc.Driver");
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            
                           
                            String queryString = "INSERT INTO `patient` (`name`, `gender`, `age`, `email`, `contact`,`address`) VALUES (?,?,?,?,?,?);";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, name);
                            pstatement.setString(2, gender);
                            pstatement.setString(3, age);
                            pstatement.setString(4, email);
                            pstatement.setString(5, contact);
                            pstatement.setString(6, address);
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
                                
                                 %>
        
                           <jsp:forward page="addAdmit.jsp"/>

            <%
                           }
                        } catch (Exception ex) {
                            out.println("Unable to connect to batabase." + ex);
                        }
                        finally{
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
