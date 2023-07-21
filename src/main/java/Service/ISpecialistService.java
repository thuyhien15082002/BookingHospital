package Service;

import Model.Specialist;
import java.util.List;

public interface ISpecialistService {
  List<Specialist> getAll() throws Exception;
  void insertSpecialist( Specialist Specialist);
  void deleteSpecialist(int id);
  void editSpecialist(Specialist Specialist);
  Specialist getSpecialistByID(int id);
}
