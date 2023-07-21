package Controller.web;


import Model.Doctor;
import Model.Specialist;
import Service.IDoctorService;
import Service.ISpecialistService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeController", value = "/web-home")
public class HomeController extends HttpServlet {

    @Inject
    private ISpecialistService specialistService;
    @Inject
    private IDoctorService doctorService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        try {
            List<Specialist> specialists = specialistService.getAll();
            request.setAttribute("specialists", specialists);

            List<Doctor> doctors = doctorService.AllDoctorlist();
            request.setAttribute("doctors", doctors);
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
