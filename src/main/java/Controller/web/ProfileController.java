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

@WebServlet(value = {"/profile","/update-profile"})
public class ProfileController extends HttpServlet {
    @Inject
    private IUserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        RequestDispatcher rd = req.getRequestDispatcher("/views/web/profile.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String url = req.getRequestURI().replace("/","");
        int id = Integer.parseInt( req.getParameter("id"));
        String name = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        if(url.equals("update-profile")){
            User user = (User) session.getAttribute("user");
            user.setUser_id(id);
            user.setName(name);
            user.setPhone(phone);
            userService.updateUSer(user);

            session.setAttribute("user",user);
            RequestDispatcher rd = req.getRequestDispatcher("/views/web/profile.jsp");
            rd.forward(req,resp);
            resp.sendRedirect("profile");
        }

    }
}
