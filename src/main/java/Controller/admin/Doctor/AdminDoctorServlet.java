package Controller.admin.Doctor;

import Model.Doctor;
import Model.Specialist;
import Service.IDoctorService;
import Service.ISpecialistService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDoctorServlet", value = "/admin-list-doctor")
public class AdminDoctorServlet extends HttpServlet {
  @Inject
  private IDoctorService doctorService;
  @Inject
  private ISpecialistService specialistService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    request.setCharacterEncoding("utf8");
    try {
      List<Doctor> doctors = doctorService.AllDoctorlist();
      request.setAttribute("doctors",doctors);
      List<Specialist> specialists = specialistService.getAll();
      request.setAttribute("specialists",specialists);



    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    RequestDispatcher S = request.getRequestDispatcher("/views/admin/admin-list-doctor.jsp");
    S.forward(request,response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
