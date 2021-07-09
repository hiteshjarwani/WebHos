<%-- 
    Document   : DoctorActive
    Created on : Nov 6, 2020, 9:20:04 PM
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
            
                String did = request.getParameter("subject");
                String status = request.getParameter("active");
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
               
                int updateQuery = 0;
                if (did != null ) {
                    if (did != "") {
                        try {
                         
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                             String queryString;
                           
                            if(status.equals("yes"))
                            {
                                 queryString = "update `doctor` set active='no' where did="+did;
                                 did="";
                            }
                            else
                            {
                                queryString = "update `doctor` set active='yes' where did="+did;
                                did="";
                            }
                           
                            pstatement = connection.prepareStatement(queryString);                           
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
                                
                                 %>
        
                           <jsp:forward page="ShowDoctor.jsp"/>
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
    </body>
</html>
