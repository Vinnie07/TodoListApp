<%-- 
    Document   : register
    Created on : 18 Nov, 2020, 11:53:23 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="CSSFiles/registercss.css">
        <link rel="stylesheet" href="CSSFiles/FooterCss.css" >
    </head>
    <body>
        <h1 class="head1">To Do List Application</h1>
        
        <ul class="list1">
            <li class="links"><a href="index.jsp">Home Page</a></li>
            <li class="links"><a href="login.jsp">Login Page</a></li>
        </ul>
        
        <br>
        
        <form action="registerValidate" method="post">
            <table class="table2" align="center" cellspacing="5" cellpadding="5">
                <tr>
                    <td>Enter First Name: </td>
                    <td><input type="text" name="fname" required></td>
                </tr>
                
                <tr>
                    <td>Enter Last Name: </td>
                    <td><input type="text" name="lname" required></td>
                </tr>
                
                <tr>
                    <td>Enter User Name: </td>
                    <td><input type="text" name="uname" required></td>
                </tr>
                
                <tr>
                    <td>Enter Password: </td>
                    <td><input type="password" name="upass" required></td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Register"></td>
                    <td><input type="reset" value="Clear"></td>
                </tr>
            </table>
        </form>
        <br><br><br><br><br><br>
        <div class="footer">
            <h5 class="head5">To Do List Application</h5>
        </div>
    </body>
</html>
