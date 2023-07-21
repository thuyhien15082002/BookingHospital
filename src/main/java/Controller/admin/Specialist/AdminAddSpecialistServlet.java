package Controller.admin.Specialist;

import Model.Specialist;
import Service.ISpecialistService;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminAddSpecialistServlet", value = "/admin-add-specialist")
public class AdminAddSpecialistServlet extends HttpServlet {
  @Inject
  private ISpecialistService specialistService;


  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      RequestDispatcher rd = request.getRequestDispatcher("/views/admin/admin-add-specialist.jsp");
      rd.forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf8");
    String name = request.getParameter("name");
    String description = request.getParameter("description");


      Specialist Specialist = new Specialist(name,description);
      specialistService.insertSpecialist(Specialist);
      request.getRequestDispatcher("views/admin/admin-list-specialist.jsp").forward(request, response);
      response.sendRedirect("admin-list-specialist");








  }
}
