package Controller.admin.Specialist;

import Model.Specialist;
import Service.ISpecialistService;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminEditSpecialistServlet", value = "/admin-edit-specialist")
public class AdminEditSpecialistServlet extends HttpServlet {
  @Inject
  private ISpecialistService specialistService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    Integer id = Integer.parseInt(request.getParameter("id"));

    Specialist s = specialistService.getSpecialistByID(id); ;

    request.setAttribute("s",s);
    RequestDispatcher r = request.getRequestDispatcher("/views/admin/admin-form-edit-specialist.jsp");
    r.forward(request,response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf8");

    Integer id = Integer.parseInt(request.getParameter("id"));

    String name = request.getParameter("name");
    String description = request.getParameter("description");
    Specialist specialists = new Specialist(id,name, description);

    specialistService.editSpecialist(specialists);




    RequestDispatcher r = request.getRequestDispatcher("views/admin/admin-list-specialist.jsp");
    r.forward(request,response);
    response.sendRedirect("admin-list-specialist");



  }
}
