package Controller.admin.User;

import Model.User;
import Service.IUserService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminListUserServlet", value = "/admin-list-user")
public class AdminListUserServlet extends HttpServlet {
  @Inject
  private IUserService userService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    List<User> users = userService.getAllUsers();
    request.setAttribute("users",users);
    RequestDispatcher s = request.getRequestDispatcher("/views/admin/admin-list-user.jsp");
    s.forward(request,response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
