<%-- 
    Document   : RoomActive
    Created on : Nov 6, 2020, 10:22:45 PM
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
            
                String rid = request.getParameter("subject");
                String status = request.getParameter("active");
                
                
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
               
                int updateQuery = 0;
                if (rid != null ) {
                    if (rid != "") {
                        try {
                         
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                             String queryString;
                           
                            if(status.equals("yes"))
                            {
                                 queryString = "update `room` set active='no' where rid="+rid;
                                
                            }
                            else
                            {
                                queryString = "update `room` set active='yes' where rid="+rid;
                                
                            }
                           
                            pstatement = connection.prepareStatement(queryString);                           
                            updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) {
                                
                                 %>
        
                           <jsp:forward page="ShowRoom.jsp"/>
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