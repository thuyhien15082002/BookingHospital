package Controller.web;

import Model.Register;
import Model.User;
import Service.IUserService;
import javax.inject.Inject;
import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckCodeRegister", value = "/register-code")
public class CheckCodeRegister extends HttpServlet {
  @Inject
  private IUserService userService;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("views/web/register-code.jsp").forward(request,response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    Integer code = Integer.parseInt(request.getParameter("code"));
    Register register = (Register) request.getSession().getAttribute("register");
    if (code != (register.getCode())) {
      String errorMessage = "Vui lòng nhập lại mã";
      request.getSession().setAttribute("errorMessage", errorMessage);
      request.getRequestDispatcher("views/web/register-code.jsp").forward(request,response);
    } else {

      userService.createUser(register.getEmail(), register.getPassword(),register.getName(),register.getRole(),register.getPhone());
      request.getSession().setAttribute("register", null);
      request.getRequestDispatcher("/views/web/login.jsp").forward(request, response);
    }
  }
}
