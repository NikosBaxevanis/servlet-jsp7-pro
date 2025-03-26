package gr.aueb.cf.helloapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
@WebServlet("inspect-request")
public class InspectRequestController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(false); //Αν βαλουμε false -> get current session (αν υπαρχει) αλλιως επιστρεφει null

        if (username != null && username.equals("nikos") && password !=null && password.equals("12345")) {
            session.setAttribute("username", username);
            session.setAttribute("role", "TEACHER");
        }
        response.sendRedirect("/school-app/teachers");

        response.getWriter().write("Session id: " + request.getSession());

        Cookie[] cookies = request.getCookies();
        if (cookies != null){
            for (Cookie cookie : cookies){
                if (cookie.getName().equals("JSESSIONID")) {
                    response.getWriter().write("Cookie name: " + cookie.getName() + ", Cookie Value" + cookie.getValue()+ "\n");
                }
            }
        }

        response.getWriter().write("Request URI: " + request.getRequestURI() + "\n");
        response.getWriter().write("Request Context Path: " + request.getContextPath() + "\n");
        response.getWriter().write("Request Servlet Path: " + request.getServletPath() + "\n");

    }
}
