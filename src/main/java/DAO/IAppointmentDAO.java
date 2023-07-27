package DAO;

import Model.Appointment;

import Model.Doctor;
import java.util.Date;

import java.sql.Date;

import java.util.List;

public interface IAppointmentDAO {

    List<Appointment> getAllAppoints();
    List<Appointment> getAllAppointsByDoctorId(int doctorId);
    void createAppointment(Appointment appointment);
    void updateAppointment(Appointment appointment);
    void deleteAppointment(int id);

    List<Appointment>sortAppointment(Appointment appointment);


    boolean isAppointmentExists(Date date, String time, int doctorId);

}
