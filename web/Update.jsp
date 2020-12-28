<%-- 
    Document   : Update
    Created on : 1 Dec, 2020, 10:50:07 AM
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
        <title>Update Page</title>
        <link rel="stylesheet" href="CSSFiles/Update.css">
        <link rel="stylesheet" href="CSSFiles/FooterCss.css">
    </head>
    <body class="bdy">
        <h1 class="head1">To Do List Application</h1>
        <br>
        <% int id = Integer.parseInt(request.getParameter("sr")); 
            //Connection to database for retriving the original values before updating them
            try {
                    Class.forName("org.h2.Driver");
                    Connection con = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from Todolist1 where SRNo = "+id);
                    while(rs.next()){
        %>
        <form method="post" action="UpdateProcess.jsp">
            <table class="table5" cellspacing="5" cellpadding="5"  align="center">
                <tr>
                    <td>SR.No: </td>
                    <td><input type="number" name="srno" value="<%= rs.getInt("SRNo") %>"></td>
                </tr>
                <h3 class="head4">Insert new data: </h3>
                
                <tr>
                    <td>Title: </td>
                    <td><input type="text" name="ntitle" value="<%= rs.getString("Title") %>"></td>
                </tr>
                    <td>Description: </td>
                    <td><input type="text" name="ndescrip" value="<%= rs.getString("Description") %>"></td>
                </tr>
                <tr>
                    <td>Target Date: </td>
                    <td><input type="date" name="ntdate" value="<%= rs.getDate("targetDate") %>"></td>
                </tr>
                <tr>
                    <td>Status: </td>
                    <td><input type="text" name="nstat" value="<%= rs.getString("Status") %>"></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Update"></td>
                </tr>
            </table>
            
            <% } 
               } catch (Exception e) {
                    System.out.println("Error!!");
                    } %>
        </form>
        <br><br><br><br><br><br><br>
        <div class="footer">
            <h5 class="head5">To Do List Application</h5>
        </div>
    </body>
</html>
