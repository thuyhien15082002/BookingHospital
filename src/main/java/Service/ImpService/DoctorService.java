package Service.ImpService;

import DAO.IDoctorDAO;
import DAO.ImpDAO.DoctorDAO;
import Model.Doctor;
import Service.IDoctorService;

import javax.inject.Inject;
import java.util.List;

public class DoctorService implements IDoctorService {
    @Inject
    private IDoctorDAO doctorDAO;

    @Override
    public List<Doctor> AllDoctorlist() {
        return doctorDAO.AllDoctorlist();
    }

    @Override
    public void insertDoctor(Doctor Doctor) {
        doctorDAO.insertDoctor(Doctor);
    }

    @Override
    public void deleteDoctor(int id) {
        doctorDAO.deleteDoctor(id);
    }

    @Override
    public void editDoctor(Doctor Doctor) {
        doctorDAO.editDoctor(Doctor);
    }

    @Override
    public Doctor getDoctorByID(int id) {
        return doctorDAO.getDoctorByID(id);
    }

    @Override
    public List<Doctor> sort() {
        return doctorDAO.sort();
    }

    @Override
    public List<Doctor> searchDoctor(String txtSearch) {
        return doctorDAO.searchDoctor(txtSearch);
    }

    @Override
    public boolean checkLoginDoctor(String email, String password) {
        return doctorDAO.checkLoginDoctor(email,password);
    }

    @Override
    public Doctor getDoctorByEmail(String email) {
        return doctorDAO.getDoctorByEmail(email);
    }
}
