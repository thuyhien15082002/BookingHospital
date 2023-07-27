package DAO.ImpDAO;

import DAO.IAppointmentDAO;
import DBConnect.DBConnect;
import Model.Appointment;

import java.sql.*;


import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO implements IAppointmentDAO {
    Statement statement = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    @Override
    public List<Appointment> getAllAppoints() {
        List<Appointment> listAppoints = new ArrayList<>();
        String sql = "select * from appointment";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                listAppoints.add(new Appointment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getDate(4), rs.getString(5), rs.getString(6), rs.getInt(7),
                        rs.getString(8), rs.getString(9), rs.getString(10)));
            }
            return listAppoints;
        }catch (SQLException e){
            return null;
        }
    }

    @Override
    public List<Appointment> getAllAppointsByDoctorId(int doctorId) {
        List<Appointment> listAppoints = new ArrayList<>();
        String sql = " select * from appointment where doctor_id =? ";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql);
            ps.setInt(1, doctorId);
            rs = ps.executeQuery();
            while(rs.next()){
                listAppoints.add(new Appointment(rs.getInt(1), rs.getInt(2), doctorId,
                        rs.getDate(4), rs.getString(5), rs.getString(6), rs.getInt(7),
                        rs.getString(8), rs.getString(9), rs.getString(10)));
            }
            return listAppoints;
        }catch (SQLException e ){
            return null;
        }
    }

    @Override
    public void createAppointment(Appointment appointment) {
        String sql = "insert into appointment (user_id, doctor_id, appointment_date, appointment_time, appointment_purpose, patient_name, phone, gender)" +
                "values(?,?,?,?,?,?,?,?)";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql);
            ps.setInt(1, appointment.getUser_id());
            ps.setInt(2, appointment.getDoctor_id());
            ps.setDate(3, (Date) appointment.getAppoint_date());
            ps.setString(4, appointment.getAppoint_time());
            ps.setString(5, appointment.getAppoint_purpose());
            ps.setString(6, appointment.getPatient_name());
            ps.setString(7,appointment.getPhone());
            ps.setString(8, appointment.getGender());
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    @Override
    public void updateAppointment(Appointment appointment) {
        String sql = "update appointment set status = ? where id = ?";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql );
            ps.setInt(1, appointment.getStatus());
            ps.setInt(2,appointment.getId());
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteAppointment(int id) {

    }

    @Override

    public List<Appointment> sortAppointment(Appointment appointment) {

        List<Appointment> list = new ArrayList<>();
        String sql ="SELECT *\n"
            + "FROM appointment\n"
            + "WHERE appointment_date = ? AND doctor_id = ? \n"
            + "ORDER BY appointment_time;\n";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(sql);
            java.sql.Date sqlSelectedDate = new java.sql.Date(appointment.getAppoint_date().getTime());
            ps.setDate(1,sqlSelectedDate);
            ps.setInt(2, appointment.getDoctor_id());
            rs = ps.executeQuery();

            while(rs.next()){
                list.add(new Appointment(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                    rs.getDate(4), rs.getString(5), rs.getString(6), rs.getInt(7),
                    rs.getString(8), rs.getString(9), rs.getString(10)));
            }
            return list;
        }catch (SQLException e){
            return null;
        }
    }



    public boolean isAppointmentExists(Date date, String time, int doctorId){
        AppointmentDAO appointmentDAO = new AppointmentDAO();
        List<Appointment> appointments = appointmentDAO.getAllAppointsByDoctorId(doctorId);
        int mt = 0;
        for( int i=0; i<appointments.size(); i++){
            Appointment appointment = appointments.get(i);
            if(date.equals(appointment.getAppoint_date())){
                System.out.println("-----------" + appointment.getAppoint_time());
                String timeMain = time + ":00";
                if(timeMain.equals(appointment.getAppoint_time())){
                    mt=0;
                }else{
                    mt=1;
                }
            }else{
                mt=1;
            }
        }
        if(mt==1){
            return true;
        }else{
            return false;
        }
    }
}
