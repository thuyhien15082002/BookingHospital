package Controller.web;

import DAO.IUserDAO;
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

@WebServlet(value = {"/change-password","/doctor-changePassword"})
public class ChangePasswordController extends HttpServlet {

    @Inject
    private IDoctorService doctorService;
    @Inject
    private IUserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        User user = (User) session.getAttribute("user");

        if(doctor != null){
            RequestDispatcher rd = req.getRequestDispatcher("/views/doctor/change-password.jsp");
            rd.forward(req,resp);
        }else if(user != null){
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/change-password.jsp");
            rd.forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldPass = req.getParameter("old-password");
        String newPass = req.getParameter("new-password");
        String confirmPass = req.getParameter("confirm-password");

        HttpSession session = req.getSession();
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        User user = (User) session.getAttribute("user");
        if(doctor != null){
            if(oldPass.equals(doctor.getPassword())){
                if(newPass.equals(confirmPass)){
                    doctor.setPassword(newPass);
                    doctorService.changePassword(doctor);
                    if(doctorService.changePassword(doctor)){
                        req.setAttribute("success","Thay đổi thành công");
                    }else{
                        req.setAttribute("failure", "Thay đổi không thành công");
                    }

                }else{
                    req.setAttribute("error1","Mật khẩu mới không trùng khớp!");
                }
            }else{
                req.setAttribute("error2","Mật khẩu cũ không trùng khớp");
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/doctor/change-password.jsp");
            rd.forward(req,resp);
        }else if(user != null){
            if(oldPass.equals(user.getPassword())){
                if(newPass.equals(confirmPass)){
                    user.setPassword(newPass);
                    userService.changePassword(user);
                    if(userService.changePassword(user)){
                        req.setAttribute("success","Thay đổi thành công");
                    }else{
                        req.setAttribute("failure", "Thay đổi không thành công");
                    }

                }else{
                    req.setAttribute("error1","Mật khẩu mới không trùng khớp!");
                }
            }else{
                req.setAttribute("error2","Mật khẩu cũ không trùng khớp");
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/change-password.jsp");
            rd.forward(req,resp);
        }

    }
}
