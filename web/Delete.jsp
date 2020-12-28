<%-- 
    Document   : Delete
    Created on : 25 Nov, 2020, 11:40:53 AM
    Author     : lenovo
--%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delete Page</title>
        <link rel="stylesheet" href="CSSFiles/indexcss.css">
        <link rel="stylesheet" href="CSSFiles/FooterCss.css">
    </head>
    <body style="background-color: lavender">
         <h1 class="head1">To Do List Application</h1>
        <% String id = request.getParameter("id");
           try {
                   Class.forName("org.h2.Driver");
                   Connection co = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
                   Statement st = co.createStatement();
                   int i = st.executeUpdate("Delete from Todolist1 where SRNo="+id); 
                   RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/TODOjsp.jsp");
                   dispatch.forward(request,response);
          } catch (Exception e) {
                   System.out.println("Error!!");
               }
        %>
        <br>
          <div class="footer" style="margin-top: 460px;">
            <h5 class="head5">To Do List Application</h5>
        </div>
    </body>
</html>
