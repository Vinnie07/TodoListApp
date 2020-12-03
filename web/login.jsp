<%-- 
    Document   : login
    Created on : 18 Nov, 2020, 11:53:12 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="CSSFiles/logincss.css">
    </head>
    <body>
        <h1 class="head1">To Do List Application</h1>
        
        <ul class="list1">
            <li class="links"><a href="index.jsp">Home Page</a></li>
            <li class="links"><a href="register.jsp">Register Page</a></li>
        </ul>
        
        <br>
        
        <form action="loginValidate" method="post">
            <table class="table1" align="center" cellspacing="5" cellpadding="5">
                <tr>
                    <td>First Name: </td>
                    <td><input type="text" name="fname"></td>
                </tr>
                <tr>
                    <td>User Name: </td>
                    <td><input type="text" name="uname"></td>
                </tr>
                
                <tr>
                    <td>Password: </td>
                    <td><input type="password" name="upass"></td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Login"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
