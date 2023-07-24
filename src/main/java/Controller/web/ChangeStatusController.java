package Controller.web;

import Model.Appointment;
import Model.Doctor;
import Service.IAppointmentService;
import Service.IDoctorService;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangeStatusController", value = "/change-status")
public class ChangeStatusController extends HttpServlet {
  @Inject
  private IAppointmentService appointmentService;
  @Inject
  private IDoctorService doctorService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Integer id =Integer.parseInt(request.getParameter("id"));
    Integer status = Integer.parseInt(request.getParameter("status"));
    Appointment appointment = new Appointment(id,0,0,null,null,null,status,null,null,null);

    appointmentService.updateAppointment(appointment);
    RequestDispatcher r= request.getRequestDispatcher("/views/doctor/doctor-home.jsp");
    r.forward(request,response);
    response.sendRedirect("doctor-home");


  }
}
