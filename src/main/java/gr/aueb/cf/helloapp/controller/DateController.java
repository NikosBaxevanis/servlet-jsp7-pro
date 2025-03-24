package gr.aueb.cf.helloapp.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/date")

public class DateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE , dd  MM yyyy HH:mm:ss");
        String currentDateTimeStr = currentDateTime.format(formatter);

        request.setAttribute("currentDateTimeStr", currentDateTimeStr);
        request.getRequestDispatcher("WEB-INF/jsp/date.jsp").forward(request,response);
    }
}

//sout