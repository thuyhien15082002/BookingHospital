package Controller.admin.Specialist;

import Service.ISpecialistService;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteSpecialistServlet", value = "/delete")
public class AdminDeleteSpecialistServlet extends HttpServlet {
    @Inject
    private ISpecialistService specialistService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf8");
    Integer id = Integer.parseInt(request.getParameter("id"));
    specialistService.deleteSpecialist(id);
    response.sendRedirect("admin-list-specialist");

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


  }
}
