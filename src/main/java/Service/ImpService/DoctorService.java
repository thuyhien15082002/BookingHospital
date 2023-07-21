package Service.ImpService;

import DAO.IDoctorDAO;
import DAO.ImpDAO.DoctorDAO;
import Model.Doctor;
import Service.IDoctorService;

import javax.inject.Inject;
import java.util.List;

public class DoctorService implements IDoctorService {
    @Inject
    private IDoctorDAO DoctorDAO;

    @Override
    public List<Doctor> AllDoctorlist() {

        return DoctorDAO.AllDoctorlist();
    }

    @Override
    public void insertDoctor(Doctor Doctor) {

        new DoctorDAO().insertDoctor(Doctor);
    }

    @Override
    public void deleteDoctor(int id) {
        new DoctorDAO().deleteDoctor(id);
    }

    @Override
    public void editDoctor(Doctor Doctor) {
        new DoctorDAO().editDoctor(Doctor);
    }

    @Override
    public Doctor getDoctorByID(int id) {
        return new DoctorDAO().getDoctorByID(id);
    }

    @Override
    public List<Doctor> sort() {
        return DoctorDAO.sort();
    }

    @Override
    public List<Doctor> searchDoctor(String txtSearch) {
        return new DoctorDAO().searchDoctor(txtSearch);
    }


}
