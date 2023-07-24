package Controller.web;

import Model.Doctor;
import Model.Specialist;
import Service.IDoctorService;
import Service.ISpecialistService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/appointment")
public class AppointmentController extends HttpServlet {

    @Inject
    private ISpecialistService specialistService;
    @Inject
    private IDoctorService doctorService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            List<Specialist> specialists = specialistService.getAll();
            req.setAttribute("specialists",specialists);
//            for (Specialist specialist:specialists) {
//                //lấy danh sách doctor theo specialist_id
//                List<Doctor> listDoctors = doctorService.getAllDoctorBySpecialistId(specialist.getId());
//                System.out.println(listDoctors);
//                req.setAttribute("listDoctors",listDoctors);
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        RequestDispatcher rd = req.getRequestDispatcher("/views/web/appointment.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        int selectedSpecialistId = Integer.parseInt(request.getParameter("specialistId"));
        List<Doctor> doctors = doctorService.getAllDoctorBySpecialistId(selectedSpecialistId);

        // Gửi dữ liệu bác sĩ dưới dạng JSON
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(generateJSON(doctors));
        out.flush();
    }
    private String generateJSON(List<Doctor> doctors) {
        StringBuilder json = new StringBuilder("[");
        for (Doctor doctor : doctors) {
            json.append("{\"name\": \"").append(doctor.getName()).append("\"},");
        }
        if (json.charAt(json.length() - 1) == ',') {
            json.deleteCharAt(json.length() - 1);
        }
        json.append("]");
        return json.toString();
    }
}
