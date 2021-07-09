<%-- 
    Document   : AssignRoom
    Created on : Nov 6, 2020, 10:08:57 PM
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
                    <TH>Select Patient</TH>
                    <TD>
                        <select name="aid">
                         <%
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            String queryString1 = "SELECT patient.pid,patient.name,admit.aid FROM patient,admit where patient.pid=admit.pid and admit.active='yes';";
                            pstatement = connection.prepareStatement(queryString1);
                            rs=pstatement.executeQuery();      
                             while(rs.next())
                                {
                            %>
                        
                            <option value="<% out.print(rs.getString("admit.aid")); %>">[<% out.print(rs.getString("patient.pid")); %>]<% out.print(rs.getString("patient.name")); %></option>
                            <%
                              }  
                            %>
                        
                        
                    </TD>
                </tr>
                
               
                <TR>
                    <TH>Select Room</TH>
                    <TD>
                        <select name="rid">
                         <%
                            

                            Class.forName("com.mysql.jdbc.Driver");
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            String queryString1s = "SELECT DISTINCT(room.rid),room.rtype from room,roomas where  room.rid not in(select rid from roomas  where active='yes') and room.active='yes' ";
                            pstatement = connection.prepareStatement(queryString1s);
                            rs=pstatement.executeQuery();      
                             while(rs.next())
                                {
                            %>
                        
                            <option value="<% out.print(rs.getString("room.rid")); %>">[<% out.print(rs.getString("room.rid")); %>]<% out.print(rs.getString("room.rtype")); %></option>
                            <%
                              }  
                            %>
                        
                        
                    </TD>
                </tr>
                
            

                <TR>
                    <TD colspan="2" style="text-align: center;"><INPUT TYPE="submit" VALUE="SUBMIT" class="button"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%
               
                
                String rid = request.getParameter("rid");
                String aid = request.getParameter("aid");
               
                
                  int updateQuery = 0;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                
                if (rid != null) {
                    if (rid != "" ) {
                        try {
                            
                            
                            
                            String queryString11 = "SELECT * FROM checkup where aid="+aid;
                            pstatement = connection.prepareStatement(queryString11);
                            rs=pstatement.executeQuery();      
                            rs.next();
                            String did= rs.getString("did");
                         
                            
                            
                            String queryString22 = "INSERT INTO `roomas` (`rid`, `aid`,`did`,`active`) VALUES (?,?,?,?);";
                            pstatement = connection.prepareStatement(queryString22);
                            pstatement.setString(1, rid);
                            pstatement.setString(2, aid);
                            pstatement.setString(3, did);
                            pstatement.setString(4,"yes");
                          
                            updateQuery = pstatement.executeUpdate();
                            
                            if (updateQuery != 0) {%>
            <br>
            <TABLE class="tab">
                <tr><th><script>alert(Assigned)</script> <jsp:forward page="ShowAssignedRoom.jsp"/> </th></tr>
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
