<%-- 
    Document   : Delete Code
    Created on : May 3, 2016, 1:05:17 AM
    Author     : ioann_000
--%>
<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Code</title>
    </head>
    <body>
         <%  
         
         
   Class.forName("com.mysql.jdbc.Driver"); 
   String myDatabase = "jdbc:mysql://localhost:3306/project_app?user=root&password=1234"; 
   Connection myConnection = DriverManager.getConnection(myDatabase);
   Statement myStatement = myConnection.createStatement();  
   
   	
   myStatement.executeUpdate("DELETE  FROM DEST WHERE ID_DEST ='"+request.getParameter("id")+"'  ");
   myStatement.close();
   myConnection.close(); 
   %>
    </body>
</html>
