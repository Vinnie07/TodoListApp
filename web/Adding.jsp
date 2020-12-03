<%-- 
    Document   : Adding
    Created on : 24 Nov, 2020, 5:27:07 PM
    Author     : lenovo
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Added in List Page</title>
    </head>
    <body style="background-color: lavender">
        
        <h1 class="head1">To Do List Application</h1>
        
        <% 
            int Sr = Integer.parseInt(request.getParameter("srno")); 
            String title = request.getParameter("tle");
            String description = request.getParameter("des");
            Date targetdate = Date.valueOf(request.getParameter("tdate"));
            String status = request.getParameter("stat");
            
            try {
                    Connection co;
                    Class.forName("org.h2.Driver");
                    co = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
                    Statement st = co.createStatement();
                    
                    int i = st.executeUpdate("insert into Todolist1 values('"+Sr+"','"+title+"','"+description+"','"+targetdate+"','"+status+"')");
        %>
        <script type="text/javascript"> alert("Data Inerted");</script>
    
               <% } catch (Exception e) {
                    System.out.println("failed"+e.getMessage());
                }
        %>
        
        <a href="TODOjsp.jsp">View the Table</a>
    </body>
</html>
