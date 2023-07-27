package DAO;

import Model.Doctor;

import javax.print.Doc;
import java.util.List;

public interface IDoctorDAO {
  List<Doctor> AllDoctorlist();
  List<Doctor> getAllDoctorBySpecialistId(int specialistId);
  void insertDoctor(Doctor doctor);
  void deleteDoctor(int id);
  Doctor getDoctorByID(int id);
  void editDoctor(Doctor doctor);
  List<Doctor>sort();
  List<Doctor>searchDoctor(String txtSearch);
  boolean checkLoginDoctor(String email, String password);
  Doctor getDoctorByEmail(String email);
  boolean changePassword(Doctor doctor);
  List<Doctor> getDoctorsByDepartment(int specialist_id);
}
