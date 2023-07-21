package Controller.admin.Doctor;

import Model.Doctor;
import Service.IDoctorService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminSearchServlet", value = "/admin-search")
public class AdminSearchServlet extends HttpServlet {
    @Inject
    private IDoctorService doctorService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      request.setCharacterEncoding("utf8");

      String txtSearch = request.getParameter("txtSearch");
      List<Doctor> doctors = doctorService.searchDoctor(txtSearch);
      request.setAttribute("doctors",doctors);
      request.getRequestDispatcher("views/admin/admin-list-doctor.jsp").forward(request,response);
  }
}
