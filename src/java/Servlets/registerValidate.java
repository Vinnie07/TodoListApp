package Servlets;

import DAOIMPL.UsersDAOIMPL;
import Model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registerValidate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fn, ln, un, pa;
            fn = request.getParameter("fname");
            ln = request.getParameter("lname");
            un = request.getParameter("uname");
            pa = request.getParameter("pass");

            Users us = new Users(fn, ln, un, pa);
            UsersDAOIMPL usimpl = new UsersDAOIMPL();

            boolean b = usimpl.addUser(us);
            if (b) {
//                    out.println("User Added!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/NewUser.html");
                    rd.forward(request, response);
            } else {
                  RequestDispatcher rd1 = getServletContext().getRequestDispatcher("/register.jsp");
                  rd1.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
