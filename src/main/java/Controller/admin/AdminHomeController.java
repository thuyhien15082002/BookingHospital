package Controller.admin;

import Model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminHomeController", value = "/admin-home")
public class AdminHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User admin = (User)session.getAttribute("admin");
        request.setAttribute("nameAdmin", admin.getName());

        RequestDispatcher S = request.getRequestDispatcher("/views/admin/admin.jsp");
        S.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
