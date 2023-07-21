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
  public void insertSpecialist(Specialist Specialist ) {
    new SpecialistDAO().insertSpecialist(Specialist);
  }

  @Override
  public void deleteSpecialist(int id) {
    new SpecialistDAO().deleteSpecialist(id);
  }

  @Override
  public void editSpecialist(Specialist Specialist) {
    new SpecialistDAO().editSpecialist(Specialist);
  }

  @Override
  public Specialist getSpecialistByID(int id) {
    return  new SpecialistDAO().getSpecialistByID(id);

  }


}
