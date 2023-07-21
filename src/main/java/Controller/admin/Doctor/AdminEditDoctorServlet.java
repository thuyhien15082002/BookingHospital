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

@WebServlet(name = "AdminEditDoctorServlet", value = "/admin-edit-doctor")
public class AdminEditDoctorServlet extends HttpServlet {
  @Inject
  private IDoctorService doctorService;
  @Inject
  private ISpecialistService specialistService;


  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    try {
      List<Specialist>s = specialistService.getAll();
      request.setAttribute("s",s);

    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    Integer id = Integer.parseInt(request.getParameter("id"));
    Doctor d = doctorService.getDoctorByID(id);
    request.setAttribute("d",d);
    RequestDispatcher r = request.getRequestDispatcher("/views/admin/admin-form-edit-doctor.jsp");
    r.forward(request,response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    Integer id = Integer.parseInt(request.getParameter("id"));

    Integer specialist_id = Integer.parseInt(request.getParameter("specialist_id"));
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String image = request.getParameter("image");
    String intro = request.getParameter("intro");
    String gender = request.getParameter("gender");
    Integer role = Integer.parseInt(request.getParameter("role"));


    Doctor doctor = new Doctor(id, specialist_id,email,password,name,phone,image,intro,gender,role);
    doctorService.editDoctor(doctor);

    RequestDispatcher r= request.getRequestDispatcher("/views/admin/admin-list-doctor.jsp");
    r.forward(request,response);
    response.sendRedirect("admin-list-doctor");

  }
}
