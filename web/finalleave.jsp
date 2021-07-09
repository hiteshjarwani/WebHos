<%-- 
    Document   : finalleave
    Created on : Nov 6, 2020, 8:56:23 PM
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
    </head>
    <body>
        <%
               Connection connection = null;
            PreparedStatement pstatement = null; 
            ResultSet rs=null; 
            String aid = request.getParameter("subject");
            String status = request.getParameter("active");
               
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
               
                int updateQuery = 0;
                if (aid != null ) {
                    if (aid != "") {
                        try {
                                 
                             connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                             String queryString;
                           
                            if(status.equals("yes"))
                            {
                                out.print("yes");
                                 queryString = "update `admit` set active='no' where aid="+aid;
                            }
                            else
                            { out.print("no");
                                queryString = "update `admit` set active='yes' where aid="+aid;
                            }
                           
                            pstatement = connection.prepareStatement(queryString);                           
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
                                
                                %>
        
                           <jsp:forward page="finallist.jsp"/>
                            <%
                            }
                        } catch (Exception ex) {
                           
                        } finally {
            // close all the connections.
                            pstatement.close();
                            connection.close();
                        }
                    }
                }

            %>
    </body>
</html>
