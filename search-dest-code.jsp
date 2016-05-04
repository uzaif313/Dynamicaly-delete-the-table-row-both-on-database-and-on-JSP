<%-- 
    Document   : search dest code
    Created on : Apr 27, 2016, 9:56:28 PM
    Author     : ioann_000
--%>

<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>destcode</title>
         <link rel="stylesheet" type="text/css" href="DELETE-BUTTON-CSS.css">
    </head>
    <style> Stable, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    
    }
th, td {
    padding: 5px;
    text-align: left;
}
</style>
         <%
            
   Class.forName("com.mysql.jdbc.Driver"); 
   String myDatabase = "jdbc:mysql://localhost:3306/project_app?user=root&password=1234"; 
   Connection myConnection = DriverManager.getConnection(myDatabase);
   Statement myStatement = myConnection.createStatement();  
   String search=request.getParameter("search");
  ResultSet rs = myStatement.executeQuery("SELECT * FROM DEST WHERE COUNTRY='"+search+"' OR CITY='"+search+"' ");     
  %>
   <table style="width:100%">
 <table id="Dest_table">
       <tr>
                  
    <th>Check </th>
    <th>Country</th>
    <th>City</th> 
    <th>Url of Destination</th>
   <th> Dest no </th>
   <th>Category</th>
  </tr>
  <tr> <%while(rs.next()){ %>
      
    <td><input type="checkbox" name=chk onclick='window.location.assign('Delete Code.jsp?id='<%=rs.getString("ID_DEST") %>")' /> </td>
    <td> <%=rs.getString("COUNTRY") %></td>
    <td> <%=rs.getString("CITY") %> </td> 
    <td> <a href=<%=rs.getString("URL") %> > <%=rs.getString("URL") %> </a>
    <td> <%=rs.getString("ID_DEST") %> </td>
  </td>
  </tr>
   <% } %>
</table>
   
<SCRIPT language="javascript">
 function deleteRow(Dest_table) {
            try {
            var table = document.getElementById(Dest_table);
            var rowCount = table.rows.length;
 
            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }
 
 
            }
            }catch(e) {
                alert(e);
            }
        }
 

 
    
    </SCRIPT>
  
    

    <% 
      
      
   myStatement.close(); 
   myConnection.close(); %>
   
   
   <div class="buttonHolder">
  
  <a href="#"  class="button cross" onclick="deleteRow('Dest_table')" ></a>

    </body>
</html>


