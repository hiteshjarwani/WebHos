<%-- 
    Document   : addAdmit
    Created on : Nov 5, 2020, 11:51:58 AM
    Author     : Jetani

"SELECT max(id) FROM tablename"
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
                
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
            String queryString1 = "SELECT * FROM patient ORDER BY pid DESC;";
            pstatement = connection.prepareStatement(queryString1);
            rs=pstatement.executeQuery();      
            rs.next();
            String pid= rs.getString("pid");
            String pname= rs.getString("name");
            
            System.out.print(pid);
            System.out.print(pname);
            
            %>
            
            <FORM action="" method="post" style="position:relative; top:180px;">
            <TABLE class="tab">
                <thead>
                    <tr>
                        <td colspan="2" style="text-align: center; font-size: 18px;">Admit Details</td>
                    </tr>
                </thead>
                <tbody>
                <TR>
                    <TH>Patient</TH>
                    <TD><INPUT TYPE="text" value=' <%= pname %>' readonly NAME="name"></TD>
                </tr>
                
               
                <TR>
                    <TH>Disease</TH>
                    <TD><INPUT TYPE="text" NAME="disease" placeholder="Disease"></TD>
                </tr>
                <TR>
                    <TH>Doctor</TH>
                    <TD>
                        <select name="doctor">
                            
                            <%
                                

                
                            Class.forName("com.mysql.jdbc.Driver");
                            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital?zeroDateTimeBehavior=convertToNull","root","");
                            String queryString2 = "SELECT * from Doctor;";
                            pstatement = connection.prepareStatement(queryString2);
                            rs=pstatement.executeQuery();   
                             while(rs.next())
                                {              %>               
                                   
                                <option value="<% out.print(rs.getString("did"));%>">  <% out.print(rs.getString("name")); %> </option>
                              
                                    
                             <%  } %>
                           
                                    
                            
                            
                           
                        </select>
                    </TD>
                </tr>

                <TR>
                    <TH>Admit date</TH>
                    <TD><INPUT TYPE="date" NAME="adate"></TD>
                </tr>
                <TR>
                    <TH>Leave Date</TH>
                    <TD><INPUT TYPE="text" NAME="ldate"></TD>
                </tr>
               <TR>
                    <TH>Active</TH>
                    <TD>Active <INPUT TYPE="radio"  checked NAME="active" value="yes">
                    Deactive <INPUT TYPE="radio" NAME="active" value="no"></TD>
                </tr>
                <TR>
                    <TD colspan="2" style="text-align: center"><INPUT class="button" TYPE="submit" VALUE="SUBMIT"></TD>
                </tr>
                </tbody>
            </TABLE>
            <%
               
                
                String disease = request.getParameter("disease");
                String adate = request.getParameter("adate");
                String ldate = request.getParameter("ldate");
                String active = request.getParameter("active");
                String doctorid = request.getParameter("doctor");
                
                
                  int updateQuery = 0;
                Class.forName("com.mysql.jdbc.Driver").newInstance();
       
               // String connectionURL = "jdbc:mysql://localhost:3306/practice_db2";
                
                if (disease != null) {
                    if (disease != "" ) {
                        try {
                            
                            String queryString = "INSERT INTO `admit` (`pid`, `disease`,`adate`, `ldate`,`active`) VALUES (?,?,?,?,?);";
                            pstatement = connection.prepareStatement(queryString);
                            pstatement.setString(1, pid);
                            pstatement.setString(2, disease);
                            pstatement.setString(3, adate);
                            pstatement.setString(4, ldate);
                            pstatement.setString(5, active);
                            
                            updateQuery = pstatement.executeUpdate();
                            
                            String queryString11 = "SELECT * FROM admit ORDER BY aid DESC;";
                            pstatement = connection.prepareStatement(queryString11);
                            rs=pstatement.executeQuery();      
                            rs.next();
                            String aid= rs.getString("aid");
                            
                            String queryString22 = "INSERT INTO `checkup` (`aid`, `did`,`active`) VALUES (?,?,?);";
                            pstatement = connection.prepareStatement(queryString22);
                            pstatement.setString(1, aid);
                            pstatement.setString(2, doctorid);
                            pstatement.setString(3,"yes");
                          
                            updateQuery = pstatement.executeUpdate();
                            
                            if (updateQuery != 0) {%>
                             <jsp:forward page="ShowPatients.jsp"/>
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
