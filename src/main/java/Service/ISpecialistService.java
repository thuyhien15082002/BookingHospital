package Service;

import Model.Specialist;
import java.util.List;

public interface ISpecialistService {
  List<Specialist> getAll();
  void insertSpecialist( Specialist specialist);
  void deleteSpecialist(int id);
  void editSpecialist(Specialist specialist);
  Specialist getSpecialistByID(int id);
}
