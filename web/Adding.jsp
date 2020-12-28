<%-- 
    Document   : Adding
    Created on : 24 Nov, 2020, 5:27:07 PM
    Author     : lenovo
--%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Added in List Page</title>
        <link rel="stylesheet" href="CSSFiles/indexcss.css">
        <link rel="stylesheet" href="CSSFiles/FooterCss.css">
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
                    if(i > 0){
                        RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/TODOjsp.jsp");
                        dispatch.forward(request,response);
                    }
                    else{
                        out.println("Error while inserting data");
                    }
            %>
        
    
               <% } catch (Exception e) {
                    System.out.println("failed"+e.getMessage());
                }
        %>
        
        <!--<a href="TODOjsp.jsp">View the Table</a>-->
        <div class="footer" style="margin-top: 480px;">
            <h5 class="head5">To Do List Application</h5>
        </div>
    </body>
</html>
