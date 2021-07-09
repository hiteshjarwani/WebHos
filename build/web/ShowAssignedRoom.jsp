<%-- 
    Document   : ShowAssignedRoom
    Created on : Nov 6, 2020, 10:50:21 PM
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
           <a href="AssignRoom.jsp" class="add"><button type="button" class="button">Assign New Room</button></a><br>
            <a href="ShowRoom.jsp" class="add" style="right:-35px; top:200px;"><button type="button" class="button">Show Rooms</button></a>
           
           
       <table class="tab">
           <thead>
             <tr>
                 <th>Room ID</th>
                 <th>Room Type</th>
                 <th>Patient ID</th>
                 <th>Patient Name</th>
                 <th>Admit ID</th>
                 <th>Disease</th>
                 <th>Doctor ID</th>
                 <th>Doctor Name</th>
                 <th>Active</th>
             </tr>            
          </thead>
          <tbody>
             <%
            
            ResultSet rs=null;        
                 Connection connection = null;
                PreparedStatement pstatement = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
             String queryString1;
            
            
                queryString1 = "SELECT room.rid,room.rtype,patient.pid,patient.name,admit.aid,admit.disease,doctor.did,doctor.name,roomas.arid,roomas.active from patient,admit,doctor,room,roomas where   admit.aid=roomas.aid and doctor.did=roomas.did and patient.pid=admit.pid and room.rid=roomas.rid;";
            
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
             while(rs.next())
                {
                   %>
                            <tr>
                                <td>
                                    <% out.print(rs.getString("room.rid")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("room.rtype")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("patient.pid")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("patient.name")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("admit.aid")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("admit.disease")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("doctor.did")); %>
                                </td> 
                                <td>
                                    <% out.print(rs.getString("doctor.name")); %>
                                </td>
                                <td><form method='post' action='AssigneroomActive.jsp'>
                                         
                                         <input type="text" value='<% out.print(rs.getString("roomas.active")); %>' name="active" hidden>
                                         <button name='subject' class="button" type='submit' value='<% out.print(rs.getString("arid")); %>'><%out.print(rs.getString("roomas.active"));%></button>
                                     
                                     </form> 
                                 </td>    
                            </tr>
        <%            
                } 
            
           
        %>
        </tbody>
         </table>
        
    </body>
</html>
