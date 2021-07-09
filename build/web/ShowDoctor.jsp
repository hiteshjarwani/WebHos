<%-- 
    Document   : ShowDoctor
    Created on : Nov 6, 2020, 3:05:08 PM
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
         
         <table class="tab">
             <thead>
             <tr>
                 <td>Doctor ID</td>
                 <td>Name</td>
                 <td>Gender</td>
                 <td>Email</td>
                 <td>Contact</td>
                 <td>Address</td>
                 <td>Expertise</td>
                 <td>Status</td>
                 <td>Active</td>
                 <td>Edit Details</td>
                 
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
            
            
                queryString1 = "SELECT * from doctor ;";
            
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
             while(rs.next())
                {
                   %>
        
                   
                       
                            <tr>
                                <td>
                                    <% out.print(rs.getString("did")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("name")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("gender")); %>
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
                                <td>
                                    <% out.print(rs.getString("expert")); %>
                                </td>
                                <td>
                                    <% out.print(rs.getString("status")); %>
                                </td>
                               
                         <td><form method='post' action='DoctorActive.jsp'>
                                         
                                         <input type="text" value='<% out.print(rs.getString("active")); %>' name="active" hidden>
                                         <button name='subject' class="button" type='submit' value='<% out.print(rs.getString("did")); %>'><%out.print(rs.getString("active"));%></button>
                                     
                                     </form> 
                                 </td>
                                  <td><form method='post' action='editdoctor.jsp'><button name='doctorid' class="button" type='submit' value='<% out.print(rs.getString("did")); %>'>Edit</button></form>
                                     </td> 
                                     
                            </tr>
                       
                            
                           
                    
                    
        <%            
                } 
            
           
        %>
             </tbody>
         </table>
          <div class="add">
            <a href="AddDoctor.jsp"><button type="button" class="button">Add Doctor</button></a>
          </div>
    </body>
</html>
