package Controller.admin.Doctor;

import Model.Doctor;
import Model.Specialist;
import Service.IDoctorService;
import Service.ISpecialistService;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import sun.misc.IOUtils;

@WebServlet(name = "AdminAddDoctorServlet", value = "/admin-add-doctor")
public class AdminAddDoctorServlet extends HttpServlet {
  @Inject
  private IDoctorService doctorService;
  @Inject
  private ISpecialistService specialistService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    try {
      List<Doctor> doctors = doctorService.AllDoctorlist();
      request.setAttribute("doctors",doctors);
      List<Specialist> specialists = specialistService.getAll();
      request.setAttribute("specialists",specialists);
      RequestDispatcher S = request.getRequestDispatcher("/views/admin/admin-add-doctor.jsp");
      S.forward(request,response);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }



  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf8");
    try {
      List<Doctor> doctors = doctorService.AllDoctorlist();
      request.setAttribute("doctors",doctors);
      List<Specialist> specialists = specialistService.getAll();
      request.setAttribute("specialists",specialists);
      RequestDispatcher S = request.getRequestDispatcher("/views/admin/admin-add-doctor.jsp");
      S.forward(request,response);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    Integer specialist_id = Integer.parseInt(request.getParameter("specialist_id"));
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String image = request.getParameter("image");
//    Part p = request.getPart("image");
//    String image = p.getSubmittedFileName();
//    InputStream imageInputStream = p.getInputStream();





    String intro = request.getParameter("intro");
    String gender = request.getParameter("gender");
    Integer role = Integer.parseInt(request.getParameter("role"));

    Doctor doctor = new Doctor(specialist_id,email,password,name,phone,image,intro,gender,role);
    doctorService.insertDoctor(doctor);
    request.getRequestDispatcher("views/admin/admin-list-doctor.jsp").forward(request, response);
    response.sendRedirect("admin-list-doctor");
  }
}
