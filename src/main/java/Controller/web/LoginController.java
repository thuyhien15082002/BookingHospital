package Controller.web;

import Model.User;
import Service.IUserService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginController", value = "/log-in")
public class LoginController extends HttpServlet {

    @Inject
    private IUserService userService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPassword");

        HttpSession session = request.getSession();
        boolean isValid = userService.checkLogin(email,password);
        if(isValid){

            User user = userService.getUserByEmail(email);
            session.setAttribute("user",user);
            session.setAttribute("email", email);
            session.setAttribute("name", user.getName());
            session.setAttribute("userId", user.getUser_id());
            if(user.getRole() == 1 ) {
                RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
                rd.forward(request, response);
                response.sendRedirect("web-home");

            }else if(user.getRole() == 2){
                RequestDispatcher rd = request.getRequestDispatcher("/views/web/Dhome.jsp");
                rd.forward(request,response);
                response.sendRedirect("web-Dhome");
            }else if(user.getRole() == 0){
//                RequestDispatcher rd = request.getRequestDispatcher("/views/web/admin.jsp");
//                rd.forward(request,response);
                User admin = userService.getUserByEmail(email);
                session.setAttribute("admin",admin);
                response.sendRedirect("admin-home");
            }else{
                RequestDispatcher rq = request.getRequestDispatcher("views/login/login.jsp");
                rq.forward(request, response);
            }

        }else{
            session.setAttribute("errorMessage", "Đăng nhập thất bại! <br> Vui lòng kiểm tra lại email và mật khẩu.");
            response.sendRedirect("log-in");
        }
    }
}
