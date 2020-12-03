<%-- 
    Document   : TODOjsp
    Created on : 18 Nov, 2020, 12:13:36 PM
    Author     : lenovo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>To Do List Page</title>
        <link rel="stylesheet" href="CSSFiles/TODOcss.css">
    </head>
    <body>
        <h1 class="head1">To Do List Application</h1>
        
        <h2 class="head2">
            Hello <%=request.getParameter("fname")%>
        </h2>
        
        <div class="sidebar">
            <p class="p1">To Do List Actions</p>
            
            <ul class="list2">
                <li class="links"><a href="Adding.html">Add item</a></li>
                <li class="links"><a href="UpdateDetails.jsp">Update item</a></li>
                <li class="links"><a href="DeleteDetails.jsp">Delete item</a></li>
            </ul>
            
        </div>
        
        <div class="mainbody">
            <p class="p1">To Do List</p>
            
                <table class="table2" border="1" cellspacing="0" cellpadding="5" align="center">
                    <tr class="thead">
                        <td>SR.No</td>
                        <td>Title</td>
                        <td>Description</td>
                        <td>Target Date</td>
                        <td>Status</td>
                    </tr>
                    
                    <% try {
                            Connection co;
                            Class.forName("org.h2.Driver");
                            co = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
                            Statement st = co.createStatement();
                            ResultSet rs = st.executeQuery("select * from Todolist1");
                            while(rs.next()){%>
                            <tr class="tbody">
                                <td><%= rs.getInt(1) %></td>
                                <td><%= rs.getString(2) %></td>
                                <td><%= rs.getString(3) %></td>
                                <td><%= rs.getDate(4) %></td>
                                <td><%= rs.getString(5) %></td>
                            </tr>
                           <% } %>
                       <% } catch (Exception e) {
                                System.out.println("Error!!"+ e.getMessage());
                        }
                    %>
                </table>
        </div>
    </body>
</html>
