package gr.aueb.cf.helloapp.controller;

import gr.aueb.cf.helloapp.model.Teacher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import static org.apache.taglibs.standard.resources.Resources.getMessage;

@WebServlet("/school-app/teachers")
public class TeachersController  extends HttpServlet {

    List<Teacher> teachers = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        teachers = List.of(new Teacher(1L, "Alice", "W."),
                new Teacher(2L, "Bob", "D."),
                new Teacher(3L, "Costas", "A."),
                new Teacher(4L, "Dimitris", "A."),
                new Teacher(5L, "Elon", "M."),
                new Teacher(6L, "Baxevanis", "N.")


        );

        String message = "";

        String filterId = request.getParameter("id");
        Long longFilterId = (filterId != null && filterId.isEmpty()) ? Long.parseLong(filterId) : null;
        String filterFirstname = request.getParameter("firstname");
        String filterLastname = request.getParameter("lastname");


        try {
            var filteredTeachers = teachers.stream().
                    filter(teacher -> longFilterId == null || teacher.getId().equals(longFilterId))
                    .filter(teacher -> filterFirstname == null || filterFirstname.isEmpty() ||
                            teacher.getFirstname().startsWith(filterFirstname))
                    .filter(teacher -> filterLastname == null || filterLastname.isEmpty() ||
                            teacher.getFirstname().startsWith(filterLastname))
                    .collect(Collectors.toList());

            if (filteredTeachers.isEmpty()) request.setAttribute("message", "Δεν βρέθηκαν καθηγητές");
            else request.setAttribute("teachers", filteredTeachers);

            request.getRequestDispatcher("/WEB-INF/jsp/teachers.jsp").forward(request,response);

        }catch (Exception e){
            message = e.getMessage();
            request.setAttribute("message",message);
            request.getRequestDispatcher("/WEB-INF/jsp/teachers.jsp").forward(request,response);
        }
    }
}
