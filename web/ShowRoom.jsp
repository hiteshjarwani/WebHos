<%-- 
    Document   : ShowRoom
    Created on : Nov 6, 2020, 10:09:32 PM
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
           <a href="AddRoom.jsp"class="add"><button type="button" class="button">Add New Room</button></a>
       <table class="tab">
           <thead>
               <tr>
                   <th colspan="4" style="text-align: center; font-size: 18px">Room Details</th>
               </tr>
           </thead>
           <tbody>
             <tr style="text-align:left;">
                 <th>Room id</th>
                 <th>Room Type</th>
                 <th>Active</th>
                 <th>Edit</th>                 
             </tr>    
        
             
             <%
            
            ResultSet rs=null;        
                 Connection connection = null;
                PreparedStatement pstatement = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
             String queryString1;
            
            
                queryString1 = "SELECT * from room ;";
            
            
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();   
             while(rs.next())
                {
                   %>
        
                   
                       
                            <tr>
                                <td>
                                    <% out.print(rs.getString("rid")); %>
                                </td>
                                 <td>
                                    <% out.print(rs.getString("rtype")); %>
                                </td>
                                
                                <td><form method='post' action='RoomActive.jsp'>
                                         
                                         <input type="text" value='<% out.print(rs.getString("active")); %>' name="active" hidden>
                                         <button name='subject' type='submit' class="button" value='<% out.print(rs.getString("rid")); %>'><%out.print(rs.getString("active"));%></button>
                                     
                                     </form> 
                                 </td>
                                  <td><form method='post' action='EditRoom.jsp'><button class="button" name='roomid' type='submit' value='<% out.print(rs.getString("rid")); %>'>Edit</button></form>
                                     </td> 
                                     
                            </tr>
                       
                            
                           
                    
                    
        <%            
                } 
            
           
        %>
        </tbody>
         </table>
        
    </body>
</html>
