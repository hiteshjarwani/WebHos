<%-- 
    Document   : ShowPatients
    Created on : Nov 6, 2020, 2:46:01 PM
    Author     : Jetani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebHos</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
         <%@include file="Header.jsp" %>
         <a href="addPatient.jsp" class="add"><button type="button" class="button">Add Patient</button></a>
         <table class="tab">
             <thead>
                <tr>
                    <th>Patient ID</th>
                    <th>Patient name</th>
                    <th>Gender</th>
                    <th>Age</th>
                    <th>Email ID</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Admit details</th>
                    <th>Edit details</th>
                </tr>
             </thead>
             <tbody>
        <%
            Connection connection = null;
            PreparedStatement pstatement = null; 
            ResultSet rs=null; 
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
            String queryString1 = "SELECT * from patient ;";
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
             while(rs.next())
                {
                   %>
                            <tr>
                                <td>
                                    <% out.print(rs.getString("pid")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("name")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("gender")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("age")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("email")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("contact")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("address")); %>
                                </td>
                                 <td><form method='post' action='finallist.jsp'><button name='search' class="button" type='submit' value='<% out.print(rs.getString("pid")); %>'>Admit Details</button>
                                     
                                     </form> </td>
                                       <td><form method='post' action='EditPatient.jsp'><button name='Patientid' class="button" type='submit' value='<% out.print(rs.getString("pid")); %>'>Edit</button></form>
                                     </td> 
                            </tr>  
                    <%            
                        } 
                    %>
            </tbody>
         </table>
    </body>
</html>
