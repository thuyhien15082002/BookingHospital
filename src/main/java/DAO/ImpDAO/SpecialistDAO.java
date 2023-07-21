package DAO.ImpDAO;



import DAO.ISpecialistDAO;
import DBConnect.DBConnect;
import Model.Specialist;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SpecialistDAO implements ISpecialistDAO {
  Statement statement = null;
  PreparedStatement ps = null;
  ResultSet rs = null;



  @Override
  public List<Specialist> getAll() throws Exception {
    List<Specialist> list = new ArrayList<>();
    String query = "SELECT * FROM Specialist";
    try{
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(query);
      rs = ps.executeQuery();
      while (rs.next()) {

        list.add(new Specialist(rs.getInt(1),
            rs.getString(2),
            rs.getString(3)));

      }

    }catch (SQLException e){
      throw new RuntimeException();
    }

    return list;
  }

  @Override
  public void insertSpecialist(Specialist Specialist) {
    String query = "INSERT INTO `Specialist`(`name`,`description`) "
        + "VALUES (?,?)";

    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(query);
      ps.setString(1, Specialist.getName());
      ps.setString(2,Specialist.getDescription());
      ps.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }


  }

  @Override
  public void deleteSpecialist(int id) {
    String query = "DELETE from Specialist Where id = ?";
    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(query);
      ps.setInt(1, id);
      ps.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public void editSpecialist(Specialist Specialist) {
    String query = "UPDATE `Specialist` SET "
        + "`name`=?,`description`=?"
        + " WHERE id= ?";


    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(query);
      ps.setString(1, Specialist.getName());
      ps.setString(2,Specialist.getDescription());
      ps.setInt(3,Specialist.getId());
      ps.executeUpdate();


    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  public Specialist getSpecialistByID(int id) {

    String query="SELECT * FROM `Specialist` WHERE id=?";

    try {
      statement = DBConnect.getInstall().get();
      ps = statement.getConnection().prepareStatement(query);
      ps.setInt(1,id);
      rs = ps.executeQuery();
      while (rs.next()) {

        return new Specialist(rs.getInt(1),
            rs.getString(2),
            rs.getString(3));

      }

    }catch (SQLException e){
      throw new RuntimeException();
    }
    return new Specialist();

  }



  public static void main(String[] args) throws Exception {
    System.out.println(new SpecialistDAO().getSpecialistByID(3));
  }
}
