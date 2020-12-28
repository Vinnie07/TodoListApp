<%-- 
    Document   : UpdateProcess
    Created on : 1 Dec, 2020, 11:04:17 AM
    Author     : lenovo
--%>
<%@page import="javax.servlet.RequestDispatcher"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Process Page</title>
        <link rel="stylesheet" href="CSSFiles/Update.css">
        <link rel="stylesheet" href="CSSFiles/FooterCss.css">
    </head>
    <body class="bdy">
        <h1 class="head1">To Do List Application</h1>
        <br>
            <%
                int serialno = Integer.parseInt(request.getParameter("srno"));
                String title = request.getParameter("ntitle");
                String description = request.getParameter("ndescrip");
                Date TargetDate = Date.valueOf(request.getParameter("ntdate"));
                String status = request.getParameter("nstat");
                
                try {
                        Class.forName("org.h2.Driver");
                        Connection co = DriverManager.getConnection("jdbc:h2:E:\\jdbc\\ToDoDB","sa","password");
                        PreparedStatement ps = co.prepareStatement("update Todolist1 set Title = ?, Description = ?, TargetDate = ?, Status = ? where SRNo = " + serialno);
                        ps.setString(1, title);
                        ps.setString(2, description);
                        ps.setDate(3, (Date) TargetDate);
                        ps.setString(4, status);
                        int i = ps.executeUpdate();
                        if (i > 0) {  
                            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/TODOjsp.jsp");
                            dispatch.forward(request, response);
//                        <!--<script type="text/javascript"> alert("List Updated!!");</script>-->
//                        <!--<a class="back1" href="TODOjsp.jsp">Check the updated list</a>-->
                        } else { %>
                            <script type="text/javascript"> alert(" Error while Updating!!");</script>
                            <a class="back1" href="TODOjsp.jsp">Back</a>
                      <%  }
                    } catch (Exception e) {
                        out.println("Error" + e.getMessage());
                    }
            %>
            
            <div class="footer" style="margin-top: 460px;">
                <h5 class="head5">To Do List Application</h5>
            </div>
    </body>
</html>
