<%-- 
    Document   : AssigneroomActive
    Created on : Nov 7, 2020, 10:28:05 AM
    Author     : Jetani
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.*"%>
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
            
                String arid = request.getParameter("subject");
                String status = request.getParameter("active");
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
               
                int updateQuery = 0;
                if (arid != null ) {
                    if (arid != "") {
                        try {
                         
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                             String queryString;
                           
                            if(status.equals("yes"))
                            {
                                 queryString = "update `roomas` set active='no' where arid="+arid;
                                
                            }
                            else
                            {
                                queryString = "update `roomas` set active='yes' where arid="+arid;
                                
                            }
                           
                            pstatement = connection.prepareStatement(queryString);                           
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
                                
                                 %>
        
                           <jsp:forward page="ShowAssignedRoom.jsp"/>
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