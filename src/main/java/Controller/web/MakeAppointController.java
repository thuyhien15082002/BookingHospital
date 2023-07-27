package Controller.web;

import Model.Appointment;
import Model.Doctor;
import Service.IAppointmentService;

import Service.IDoctorService;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

import org.json.JSONObject;
@WebServlet(urlPatterns = "/make-appointment")
public class MakeAppointController extends HttpServlet {

    @Inject
    private IAppointmentService appointmentService;
    @Inject
    private IDoctorService doctorService;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        //        String patientName = request.getParameter("name");
//        String gender = request.getParameter("gender");
//        String phone = request.getParameter("phone");
//
//        //Lấy ngày về dạng String
//        String dateString = request.getParameter("date");
//        String timeString = request.getParameter("time");
//        String dateFormat = "yyyy-MM-dd";
//        String timeFormat = "HH:mm:ss";
//        // Khởi tạo đối tượng SimpleDateFormat với định dạng ngày
//        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
//        SimpleDateFormat sdfTime = new SimpleDateFormat(timeFormat);
//        // Chuyển chuỗi thành kiểu Date
//        Date date = null;
//        Date time = null;
//        java.sql.Time timeTime = null;
//        try {
//            // Chuyển chuỗi ngày thành kiểu Date
//            date = sdf.parse(dateString);
//            // Chuyển chuỗi giờ thành kiểu Date
//            time = sdf.parse(timeString);
//            // Chuyển từ kiểu Date thành kiểu Time
//            timeTime = new java.sql.Time(date.getTime());
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
        //End change Type Date


//        int selectedDoctorId = Integer.parseInt(request.getParameter("selectedDoctorId"));
//        int userId = Integer.parseInt(request.getParameter("userId"));
//        String purpose = request.getParameter("message");
//        Appointment appointment = new Appointment(0, userId, selectedDoctorId, date, timeTime , purpose, 0, patientName, phone, gender);
//        appointmentService.createAppointment(appointment);

//        RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
//        rd.forward(request,response);
//        response.sendRedirect("web-home");
        // Đọc dữ liệu gửi từ form
        String jsonData = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        JSONObject data = new JSONObject(jsonData);

        // Lấy các giá trị từ đối tượng JSON
        int selectedDoctorId = data.getInt("selectedDoctorId");
        String name = data.getString("name");
        String gender = data.getString("gender");
        String phone = data.getString("phone");
        String dateString = data.getString("date");
        String time = data.getString("time");
        String message = data.getString("message");
        int userId = data.getInt("userId");
        // Chuyển chuỗi ngày thành kiểu Date
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date sqlDate = null;
        java.util.Date  utilDate = null;
        try {
            utilDate = dateFormat.parse(dateString);
            sqlDate = new java.sql.Date(utilDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        boolean isAppointmentExists = appointmentService.isAppointmentExists(sqlDate, time, selectedDoctorId);
        if(isAppointmentExists){
            Appointment appointment = new Appointment(0,userId, selectedDoctorId,sqlDate,time,message,0,name,phone, gender );
            appointmentService.createAppointment(appointment);
            response.setStatus(HttpServletResponse.SC_OK); // 200 OK - Thành công
            response.getWriter().write("Đặt lịch thành công!");
        }else{
            response.setStatus(HttpServletResponse.SC_CONFLICT); // 409 Conflict - Trùng lặp
            response.getWriter().write("Ngày và giờ đã được người khác đặt trước đó. Vui lòng chọn thời gian khác.");
        }





        int selectedDoctorId = Integer.parseInt(request.getParameter("selectedDoctorId"));
        int selectedDepartmentId = Integer.parseInt(request.getParameter("selectedDepartmentId"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String purpose = request.getParameter("message");
        Appointment appointment = new Appointment(0, userId, selectedDoctorId, date, null , purpose, 0, patientName, phone, gender);
        List<Doctor> doctors = doctorService.getDoctorsByDepartment(selectedDepartmentId);
        request.setAttribute("doctors",doctors);
        appointmentService.createAppointment(appointment);



    }

}
