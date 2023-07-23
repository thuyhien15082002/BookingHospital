package DAO.ImpDAO;

import DAO.IAppointmentDAO;
import DBConnect.DBConnect;
import Model.Appointment;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                        rs.getDate(4), rs.getTime(5), rs.getString(6), rs.getInt(7),
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
                        rs.getDate(4), rs.getTime(5), rs.getString(6), rs.getInt(7),
                        rs.getString(8), rs.getString(9), rs.getString(10)));
            }
            return listAppoints;
        }catch (SQLException e ){
            return null;
        }
    }

    @Override
    public void createAppointment(Appointment appointment) {

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
}
