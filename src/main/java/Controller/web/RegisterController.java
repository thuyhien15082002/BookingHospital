package Controller.web;

import Model.Register;
import Model.User;
import Service.IUserService;
import java.util.Random;
import javax.inject.Inject;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/web-register")
public class RegisterController extends HttpServlet {
  @Inject
  private IUserService userService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    RequestDispatcher rd = request.getRequestDispatcher("/views/web/register.jsp");
    rd.forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");

    Random random = new Random();
    int code = random.nextInt(999999);
    User user = userService.checkUserExist(email);
    if (password == null){
      String errorMessage = "Vui lòng nhập lại";
      request.getSession().setAttribute("errorMessage", errorMessage);
      response.sendRedirect("web-register");

    }else if (user!= null) {
      String errorMessage = "Vui lòng nhập email khác";
      request.getSession().setAttribute("errorMessage", errorMessage);
      response.sendRedirect("web-register");
    }
    else {
      Register register = new Register(email,password,name,1,phone,code);
      userService.sendEmail(register);
      HttpSession session = request.getSession();
      session.setAttribute("register", register);
      response.sendRedirect("register-code");
    }







  }
}
