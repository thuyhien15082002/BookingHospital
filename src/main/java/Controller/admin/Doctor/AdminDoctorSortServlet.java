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

@WebServlet(name = "AdminDoctorSortServlet", value = "/admin-sort")
public class AdminDoctorSortServlet extends HttpServlet {
  @Inject
  private IDoctorService doctorService;
  @Inject
  private ISpecialistService specialistService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf8");

    try {
      List<Specialist> specialists = specialistService.getAll();
      request.setAttribute("specialists",specialists);
      List<Doctor> doctors = doctorService.sort();
      request.setAttribute("doctors",doctors);
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
