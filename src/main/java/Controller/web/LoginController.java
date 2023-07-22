package Controller.web;

import Model.Doctor;
import Model.User;
import Service.IDoctorService;
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
    @Inject
    private IDoctorService doctorService;
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
        boolean isValidDoctor = doctorService.checkLoginDoctor(email,password);
        boolean isValid = userService.checkLogin(email,password);
        if(isValidDoctor && !isValid){
            Doctor doctor = doctorService.getDoctorByEmail(email);
            session.setAttribute("doctor",doctor);
            session.setAttribute("email", email);
//            session.setAttribute("doctorName", doctor.getName());
//            session.setAttribute("doctorId", doctor.getId());

            RequestDispatcher rd = request.getRequestDispatcher("/views/doctor/doctor-home.jsp");
            rd.forward(request,response);
            response.sendRedirect("doctor-home");
        }else if( !isValidDoctor && isValid){
            User user = userService.getUserByEmail(email);

            if(user.getRole() == 1 ) {
                session.setAttribute("user",user);
                session.setAttribute("email", email);
                session.setAttribute("name", user.getName());
                session.setAttribute("userId", user.getUser_id());

                RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
                rd.forward(request, response);
                response.sendRedirect("web-home");

            }else if(user.getRole() == 0){
                session.setAttribute("admin",user);
                session.setAttribute("emailAdmin", email);
                session.setAttribute("nameAdmin", user.getName());
                session.setAttribute("idAdmin", user.getUser_id());

//                RequestDispatcher rd = request.getRequestDispatcher("/views/web/admin.jsp");
//                rd.forward(request,response);
                response.sendRedirect("admin-home");
            }else{
                RequestDispatcher rq = request.getRequestDispatcher("views/login/login.jsp");
                rq.forward(request, response);
            }
        }else{
            session.setAttribute("errorMessage", "Đăng nhập thất bại! <br> Vui lòng kiểm tra lại email và mật khẩu.");
            response.sendRedirect("log-in");
        }



//        if(isValidDoctor){
//            RequestDispatcher rd = request.getRequestDispatcher("/views/web/doctor.jsp");
//            rd.forward(request,response);
//            response.sendRedirect("web-Dhome");
//        }else{
//            session.setAttribute("errorMessage", "Đăng nhập thất bại! <br> Vui lòng kiểm tra lại email và mật khẩu.");
//            response.sendRedirect("log-in");
//        }
//
//        if(isValid){
//
//            User user = userService.getUserByEmail(email);
//            session.setAttribute("user",user);
//            session.setAttribute("email", email);
//            session.setAttribute("name", user.getName());
//            session.setAttribute("userId", user.getUser_id());
//            if(user.getRole() == 1 ) {
//
//                RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
//                rd.forward(request, response);
//                response.sendRedirect("web-home");
//
//            }else if(user.getRole() == 0){
////                User admin = userService.getUserByEmail(email);
////                session.setAttribute("admin",admin);
//
//                RequestDispatcher rd = request.getRequestDispatcher("/views/web/admin.jsp");
//                rd.forward(request,response);
//                response.sendRedirect("admin-home");
//            }else{
//                RequestDispatcher rq = request.getRequestDispatcher("views/login/login.jsp");
//                rq.forward(request, response);
//            }
//        }else{
//            session.setAttribute("errorMessage", "Đăng nhập thất bại! <br> Vui lòng kiểm tra lại email và mật khẩu.");
//            response.sendRedirect("log-in");
//        }
    }
}
