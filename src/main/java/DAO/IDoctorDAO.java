package DAO;

import Model.Doctor;
import java.util.List;

public interface IDoctorDAO {
  List<Doctor> AllDoctorlist();
  void insertDoctor(Doctor Doctor);
  void deleteDoctor(int id);
  Doctor getDoctorByID(int id);
  void editDoctor(Doctor Doctor);
  List<Doctor>sort();
  List<Doctor>searchDoctor(String txtSearch);

}
