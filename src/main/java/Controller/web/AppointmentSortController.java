package Controller.web;

import Model.Appointment;
import Model.Doctor;
import Model.Specialist;
import Service.IAppointmentService;
import Service.IDoctorService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AppointmentSortController", value = "/doctor-appoint-sort")
public class AppointmentSortController extends HttpServlet {
  @Inject
  private IAppointmentService appointmentService;
  @Inject
  private IDoctorService doctorService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.setCharacterEncoding("utf8");
    String selectedDateStr = request.getParameter("appointment_date");
    Date appointment_date = null;
    try {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      appointment_date = sdf.parse(selectedDateStr);

    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
    Appointment appointment = new Appointment(0,0,doctor_id,appointment_date,null,null,0,null,null,null);
    List<Appointment> listAppoints = appointmentService.sortAppointment(appointment);
    request.setAttribute("listAppoints",listAppoints);

    RequestDispatcher S = request.getRequestDispatcher("/views/doctor/doctor-home.jsp");
    S.forward(request,response);


  }
}
