package Controller.web;

import Model.Appointment;
import Service.IAppointmentService;

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
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

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






  }

}