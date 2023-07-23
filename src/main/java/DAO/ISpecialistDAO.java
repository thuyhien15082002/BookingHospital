package DAO;

import Model.Specialist;
import java.util.List;

public interface ISpecialistDAO {
  List<Specialist> getAll() throws Exception;
  void insertSpecialist(Specialist specialist );
  void deleteSpecialist(int id);
  void editSpecialist(Specialist specialist);
  Specialist getSpecialistByID(int id);
}
