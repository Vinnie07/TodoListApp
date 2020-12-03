<%-- 
    Document   : UpdateDetails
    Created on : 29 Nov, 2020, 12:29:09 PM
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
        <title>Update Details Page</title>
        <link rel="stylesheet" href="CSSFiles/Update.css">
    </head>
    <body class="bdy">
        <h1 class="head1">To Do List Application</h1>
        <br>
        <form action="Update.jsp" method="post">
            <table class="table4" cellspacing="0" cellpadding="5" align="center" border="1">
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
                           <%  }  
                    } catch (Exception e) {
                            System.out.println("Error while updating");
                    }
 
                %>
            </table>
            <p>Please enter the Serial Number from the list which you want to update: 
                <input type="number" name="sr">
                <input type="submit" value="Confirm">
            </p>
        </form>
    </body>
</html>
