package Controller.admin.Doctor;

import Service.IDoctorService;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteDoctorServlet", value = "/admin-delete")
public class AdminDeleteDoctorServlet extends HttpServlet {
  @Inject
  private IDoctorService doctorService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");

    Integer id = Integer.parseInt(request.getParameter("id"));
    doctorService.deleteDoctor(id);
    response.sendRedirect("admin-list-doctor");

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
