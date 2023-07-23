package DAO.ImpDAO;

import DAO.IUserDAO;
import DBConnect.DBConnect;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
  Statement statement = null;
  PreparedStatement ps = null;
  ResultSet rs = null;

  @Override
  public List<User> getAllUsers() {
    List<User> listUsers = new ArrayList<>();
    String sql = "select * from user";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      rs = ps.executeQuery();
      while (rs.next()) {
        User user = new User(rs.getInt("id"), rs.getString("email"), rs.getString("password"), rs.getString("name"), rs.getInt("role"), rs.getString("phone"));
        listUsers.add(user);
        return listUsers;
      }
    }catch (SQLException e){
      return  null;
    }
    return null;
  }

  @Override
  public User getUserById(int userId) {
    String sql = "select * from user where id=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setInt(1, userId);
      rs = ps.executeQuery();
      while (rs.next()){
        User user = new User(rs.getInt("id"),rs.getString("email"),rs.getString("password"),rs.getString("name"),rs.getInt("role"),rs.getString("phone"));
        return user;
      }
    }catch (SQLException e){
      return null;
    }
    return null;
  }

  @Override
  public List<User> getUsersByKeyword(String keyword) {
    return null;
  }

  @Override
  public User getUserByEmail(String email) {
    String sql = "select * from user where email=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setString(1,email);
      rs = ps.executeQuery();
      while (rs.next()){
        User user = new User(rs.getInt("id"),rs.getString("email"),rs.getString("password"),rs.getString("name"),rs.getInt("role"),rs.getString("phone"));
        return user;
      }
    }catch (SQLException e){
      return null;
    }
    return null;
  }

  @Override
  public void createUser(User user) {

  }

  @Override
  public void updateUSer(User user) {
    String sql = "update user set name=? , phone=? where id=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setString(1, user.getName());
      ps.setString(2, user.getPhone());
      ps.setInt(3, user.getUser_id());
      ps.executeUpdate();
    }catch (SQLException e){
      e.printStackTrace();
    }
  }

  @Override
  public void updatePasswordUSer(User user) {
    String sql = "update user set password=? where id=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setString(1, user.getPassword());
      ps.setInt(2, user.getUser_id());
      ps.executeUpdate();
    }catch (SQLException e){
      e.printStackTrace();
    }
  }

  @Override
  public void deleteUser(int userId) {
    String sql = "delete from user where id=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setInt(1,userId);
      ps.executeUpdate();
    }catch (SQLException e){
      e.printStackTrace();
    }
  }

  @Override
  public boolean checkLogin(String email, String password) {
    boolean isValid = false;
    String sql = "select * from user where email=? and password=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setString(1, email);
      ps.setString(2, password);
      rs = ps.executeQuery();
      if(rs.next()){
        isValid = true;
      }else{
        isValid = false;
      }

    } catch (SQLException e) {
      return false;
    }

    return isValid;
  }

  @Override
  public boolean changePassword(User user) {
    String sql = "update user set password=? where id=?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(sql);
      ps.setString(1, user.getPassword());
      ps.setInt(2, user.getUser_id());
      ps.executeUpdate();
      return true;
    }catch (SQLException e){
      e.printStackTrace();
    }
    return false;
  }

  public static void main(String[] args) {
    User user = new User();
    UserDAO userDAO = new UserDAO();
//        user.setUser_id(3);
//        user.setPassword("iloveu");
//        userDAO.updatePasswordUSer(user);
    userDAO.deleteUser(3);
  }
}