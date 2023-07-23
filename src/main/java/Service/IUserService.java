package Service;

import Model.Register;
import Model.User;
import java.util.List;

public interface IUserService {
  List<User> getAllUsers();

  User getUserById(int userId);

  List<User> getUsersByKeyword(String keyword);

  User getUserByEmail(String email);

  void createUser(String email, String password, String name, int role, String phone);

  void updateUSer(User user);

  void updatePasswordUSer(User user);

  void deleteUser(int userId);

  boolean checkLogin(String email, String password);
  void sendEmail(Register register );
  User checkUserExist(String email);

  boolean changePassword(User user);

}
