package DAO.ImpDAO;

import DAO.IDoctorDAO;
import DBConnect.DBConnect;

import Model.Doctor;
import java.sql.PreparedStatement;
import java.sql.ResultSet;;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO implements IDoctorDAO {
    Statement statement = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    @Override
    public List<Doctor> AllDoctorlist() {
        List<Doctor> list = new ArrayList<>();
        String query = "SELECT * FROM doctor";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Doctor(rs.getInt("id"),
                        rs.getInt("specialist_id"), rs.getString("email"),
                        rs.getString("password"), rs.getString("name"),
                        rs.getString("phone"), rs.getString("image"),
                        rs.getString("intro"), rs.getString("gender"),rs.getInt("role")));
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void insertDoctor(Doctor doctor) {
        String query = "INSERT INTO `doctor`(`specialist_id`, `email`, `password`, `name`, `phone`, `image`, `intro`, `gender`, `role`) "
            + "VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            ps.setInt(1,doctor.getSpecialist_id());
            ps.setString(2,doctor.getEmail() );
            ps.setString(3,doctor.getPassword());
            ps.setString(4,doctor.getName());
            ps.setString(5,doctor.getPhone());
            ps.setString(6,doctor.getImage());
            ps.setString(7, doctor.getIntro());
            ps.setString(8,doctor.getGender());
            ps.setInt(9,doctor.getRole());

            ps.executeUpdate();


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void deleteDoctor(int id) {
        String query = "delete from doctor where id =?";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public Doctor getDoctorByID(int id) {
        String query="SELECT * FROM `doctor` WHERE id=?";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return new Doctor(rs.getInt(1),
                    rs.getInt(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getInt(10));
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return new Doctor();
    }

    @Override
    public void editDoctor(Doctor doctor) {
        String query = "UPDATE `doctor` "
            + "SET `specialist_id`=?,`email`=?,`password`=?,"
            + "`name`=?,`phone`=?,`image`=?,`intro`=?,`gender`=?,`role`=? "
            + "WHERE id=?";


        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            ps.setInt(1,doctor.getSpecialist_id());
            ps.setString(2,doctor.getEmail() );
            ps.setString(3,doctor.getPassword());
            ps.setString(4,doctor.getName());
            ps.setString(5,doctor.getPhone());
            ps.setString(6,doctor.getImage());
            ps.setString(7, doctor.getIntro());
            ps.setString(8,doctor.getGender());
            ps.setInt(9,doctor.getRole());
            ps.setInt(10,doctor.getId());
            ps.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    @Override
    public List<Doctor> sort() {
        List<Doctor> list = new ArrayList<>();
        String query = "SELECT * FROM doctor ORDER BY name";
        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Doctor(rs.getInt("id"),
                    rs.getInt("specialist_id"), rs.getString("email"),
                    rs.getString("password"), rs.getString("name"),
                    rs.getString("phone"), rs.getString("image"),
                    rs.getString("intro"), rs.getString("gender"),rs.getInt("role")));
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public List<Doctor> searchDoctor(String txtSearch) {
        List<Doctor> list = new ArrayList<>();
        String query="SELECT * FROM `doctor` WHERE `name` LIKE ?";

        try {
            statement = DBConnect.getInstall().get();
            ps = statement.getConnection().prepareStatement(query);
            ps.setString(1, "%"+txtSearch+"%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Doctor(rs.getInt(1),
                    rs.getInt(2), rs.getString(3),
                    rs.getString(4), rs.getString(5),
                    rs.getString(6), rs.getString(7),
                    rs.getString(8), rs.getString(9),rs.getInt(10)));
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    public static void main(String[] args) {
        System.out.println(new DoctorDAO().getDoctorByID(3));
    }
}

