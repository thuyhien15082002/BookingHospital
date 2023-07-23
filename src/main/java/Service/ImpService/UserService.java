package Service.ImpService;

import DAO.IUserDAO;
import DAO.ImpDAO.UserDAO;
import Model.Register;
import Model.User;
import Service.IUserService;
import java.util.List;
import javax.inject.Inject;

public class UserService implements IUserService {
  @Inject
  private IUserDAO userDAO;
  @Override
  public List<User> getAllUsers() {
    return userDAO.getAllUsers();
  }

  @Override
  public User getUserById(int userId) {
    return userDAO.getUserById(userId);
  }

  @Override
  public List<User> getUsersByKeyword(String keyword) {
    return null;
  }

  @Override
  public User getUserByEmail(String email) {
    return userDAO.getUserByEmail(email);
  }

  @Override
  public void createUser(String email, String password, String name, int role, String phone) {
    userDAO.createUser(email, password,name, role, phone);

  }

  @Override
  public void updateUSer(User user) {
    userDAO.updateUSer(user);
  }

  @Override
  public void updatePasswordUSer(User user) {
    userDAO.updatePasswordUSer(user);
  }

  @Override
  public void deleteUser(int userId) {
    userDAO.deleteUser(userId);
  }

  @Override
  public boolean checkLogin(String email, String password) {
    return userDAO.checkLogin(email,password);
  }

  @Override

  public void sendEmail(Register register) {
    userDAO.sendEmail(register);
  }

  @Override
  public User checkUserExist(String email) {
    return userDAO.checkUserExist(email);
  }
  public boolean changePassword(User user) {
    return userDAO.changePassword(user);

  }
}

