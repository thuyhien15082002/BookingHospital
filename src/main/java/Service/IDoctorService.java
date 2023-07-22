package Service;

import Model.Doctor;

import javax.print.Doc;
import java.util.List;

public interface IDoctorService {
    List<Doctor> AllDoctorlist();
    void insertDoctor(Doctor Doctor);
    void deleteDoctor(int id);
    void editDoctor(Doctor Doctor);
    Doctor getDoctorByID(int id);
    List<Doctor> sort();
    List<Doctor>searchDoctor(String txtSearch);
    boolean checkLoginDoctor(String email, String password);
    Doctor getDoctorByEmail(String email);



}
