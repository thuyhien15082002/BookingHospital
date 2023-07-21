package Service.ImpService;

import DAO.IUserDAO;
import DAO.ImpDAO.UserDAO;
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
  public void createUser(User user) {

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
}

