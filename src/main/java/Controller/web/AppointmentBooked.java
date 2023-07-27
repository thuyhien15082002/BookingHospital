package Controller.web;

import Model.Appointment;
import Model.Doctor;
import Model.User;
import Service.IAppointmentService;
import Service.IDoctorService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/appointment-booked")
public class AppointmentBooked extends HttpServlet {

    @Inject
    private IAppointmentService appointmentService;
    @Inject
    private IDoctorService doctorService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        List<Appointment> appointmentList = appointmentService.getAllAppointsByUserId(user.getUser_id());
        req.setAttribute("appointmentList",appointmentList);
        List<Doctor> doctorList = doctorService.AllDoctorlist();
        req.setAttribute("doctorList",doctorList);
        RequestDispatcher rd = req.getRequestDispatcher("/views/web/appointmentBooked.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
