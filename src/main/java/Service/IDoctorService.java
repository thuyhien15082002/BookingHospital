package Service;

import Model.Doctor;

import javax.print.Doc;
import java.util.List;

public interface IDoctorService {

    List<Doctor> AllDoctorlist();
    void insertDoctor(Doctor doctor);
    void deleteDoctor(int id);
    void editDoctor(Doctor doctor);
    Doctor getDoctorByID(int id);
    List<Doctor> sort();
    List<Doctor>searchDoctor(String txtSearch);
    boolean checkLoginDoctor(String email, String password);
    Doctor getDoctorByEmail(String email);
    boolean changePassword(Doctor doctor);
    List<Doctor> getAllDoctorBySpecialistId(int specialistId);


}
