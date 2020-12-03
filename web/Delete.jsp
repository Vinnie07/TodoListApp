<%-- 
    Document   : Delete
    Created on : 25 Nov, 2020, 11:40:53 AM
    Author     : lenovo
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Page</title>
    </head>
    <body style="background-color: lavender">
         <h1 class="head1">To Do List Application</h1>
        <% String id = request.getParameter("id");
           try {
                   Class.forName("org.h2.Driver");
                   Connection co = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
                   Statement st = co.createStatement();
                   int i = st.executeUpdate("Delete from Todolist1 where SRNo="+id); 
        %>
                   <script type="text/javascript"> 
                       alert("Data Deleted!");
                   </script>
                   
        <%  } catch (Exception e) {
                   System.out.println("Error!!");
               }
        %>
        <br>
          <a href="TODOjsp.jsp">View the Table</a>
    </body>
</html>
