<%-- 
    Document   : assignecheckup
    Created on : Nov 5, 2020, 9:02:35 PM
    Author     : Jetani

pid ,pname ,aid ,disease ,adate ,ldate, active ,doctore ,doctor ,id 
 while(rs.next())
                {
                    System.out.println(rs.getInt(1)+ " " + rs.getString(2));
                } 

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
         <table class="tab">
             <thead>
                <tr>
                    <th>Patient ID</th>
                    <th>Patient Name</th>
                    <th>Admit ID</th>
                    <th>Disease</th>
                    <th>Admit Date</th>
                    <th>Leave Date</th>
                    <th>Checkup ID</th>
                    <th>Doctor ID</th>
                    <th>Doctor Name</th>
                    <th>Patient Active</th>
                </tr>    
             </thead>
             <tbody>
        <%
            Connection connection = null;
            PreparedStatement pstatement = null; 
            ResultSet rs=null; 
            String sp=request.getParameter("search");
             
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
            String queryString1;
            if(sp != null && sp !="" )
            {
                queryString1 = "SELECT patient.pid,patient.name,admit.aid,admit.active,admit.disease,admit.adate,admit.ldate,admit.active,checkup.cid,doctor.did,doctor.name FROM patient,admit,checkup,doctor where admit.pid=patient.pid and checkup.aid=admit.aid and checkup.did=doctor.did  and patient.pid="+sp;
                
            }
            else
            {
                queryString1 = "SELECT patient.pid,patient.name,admit.aid,admit.active,admit.disease,admit.adate,admit.ldate,admit.active,checkup.cid,doctor.did,doctor.name FROM patient,admit,checkup,doctor where admit.pid=patient.pid and checkup.aid=admit.aid and checkup.did=doctor.did ;";
            }
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
             while(rs.next())
                {
                   %>
        
                   
                       
                            <tr>
                                <td>
                                    <% out.print(rs.getString("patient.pid")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("name")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("aid")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("disease")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("adate")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("ldate")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("cid")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("did")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("doctor.name")); %>
                                </td>
                        
                                
                                
                                <td>
                                    <form method='post' action='finalleave.jsp'>
                                        <input type="text" value='<% out.print(rs.getString("active")); %>' name="active" hidden>
                                        <button name='subject' class="button" type='submit' value='<% out.print(rs.getString("aid")); %>'><%out.print(rs.getString("admit.active"));%></button>
                                   
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
