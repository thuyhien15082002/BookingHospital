package DAO;

import Model.User;
import java.util.List;

public interface IUserDAO {
  List<User> getAllUsers();

  User getUserById(int userId);

  List<User> getUsersByKeyword(String keyword);

  User getUserByEmail(String email);

  void createUser(User user);

  void updateUSer(User user);

  void updatePasswordUSer(User user);

  void deleteUser(int userId);

  boolean checkLogin(String email, String password);

}
