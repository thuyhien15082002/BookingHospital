package Controller.admin.Specialist;

import Model.Specialist;
import Service.ISpecialistService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminSpecialistServlet", value = "/admin-list-specialist")
public class AdminSpecialistServlet extends HttpServlet {
    @Inject
    private ISpecialistService specialistService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    try {

      List<Specialist> specialists = specialistService.getAll();
      request.setAttribute("specialists",specialists);
    } catch (Exception e) {
      throw new RuntimeException(e);
    }
    RequestDispatcher S = request.getRequestDispatcher("/views/admin/admin-list-specialist.jsp");
    S.forward(request,response);

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


  }
}
