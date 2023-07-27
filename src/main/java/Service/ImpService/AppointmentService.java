package Service.ImpService;

import DAO.IAppointmentDAO;
import Model.Appointment;
import Service.IAppointmentService;

import java.util.Date;
import javax.inject.Inject;
import java.util.List;

public class AppointmentService implements IAppointmentService {
    @Inject
    private IAppointmentDAO appointmentDAO;
    @Override
    public List<Appointment> getAllAppoints() {
        return appointmentDAO.getAllAppoints();
    }

    @Override
    public List<Appointment> getAllAppointsByDoctorId(int doctorId) {
        return appointmentDAO.getAllAppointsByDoctorId(doctorId);
    }

    @Override
    public void createAppointment(Appointment appointment) {
        appointmentDAO.createAppointment(appointment);
    }

    @Override
    public void updateAppointment(Appointment appointment) {
        appointmentDAO.updateAppointment( appointment);
    }

    @Override
    public void deleteAppointment(int id) {

    }

    @Override
    public List<Appointment> sortAppointment(Appointment appointment) {
        return appointmentDAO.sortAppointment( appointment );
    }
}
