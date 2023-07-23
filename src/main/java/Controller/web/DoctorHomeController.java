package Controller.web;

import Model.Appointment;
import Model.Doctor;
import Service.IAppointmentService;

import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DoctorHomeController", value = "/doctor-home")
public class DoctorHomeController extends HttpServlet {
    @Inject
    private IAppointmentService appointmentService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        List<Appointment> listAppoints = appointmentService.getAllAppointsByDoctorId(doctor.getId());
        request.setAttribute("listAppoints", listAppoints);
        RequestDispatcher rd = request.getRequestDispatcher("/views/doctor/doctor-home.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
