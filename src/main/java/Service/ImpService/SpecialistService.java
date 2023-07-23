package Service.ImpService;

import DAO.ISpecialistDAO;
import DAO.ImpDAO.SpecialistDAO;
import Model.Specialist;
import Service.ISpecialistService;

import java.util.List;
import javax.inject.Inject;

public class SpecialistService implements ISpecialistService {

  @Inject
  private ISpecialistDAO SpecialistDAO;

  @Override
  public List<Specialist> getAll() throws Exception {
    return new SpecialistDAO().getAll();
  }

  @Override
  public void insertSpecialist(Specialist specialist ) {
     SpecialistDAO.insertSpecialist(specialist);
  }

  @Override
  public void deleteSpecialist(int id) {
     SpecialistDAO.deleteSpecialist(id);
  }

  @Override
  public void editSpecialist(Specialist specialist) {
    SpecialistDAO.editSpecialist(specialist);
  }

  @Override
  public Specialist getSpecialistByID(int id) {
    return  SpecialistDAO.getSpecialistByID(id);

  }


}
