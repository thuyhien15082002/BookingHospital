package DBConnect;

import java.sql.*;

public class DBConnect {
  private String url = "jdbc:mysql://localhost:3306/hospitalbooking";
  private String user = "root";
  private String pass = "280412092312";
  Connection connection;
  private  static DBConnect install;

  private  DBConnect() {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      connection = DriverManager.getConnection(this.url, this.user, this.pass);
    } catch (ClassNotFoundException | SQLException e) {
      throw new RuntimeException(e);
    }
  }

  public static DBConnect getInstall() {
    if (install == null)
      install = new DBConnect();
    return install;
  }

  public Statement get() {
    try {
      if(connection == null)
        return null;
      return connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    } catch (SQLException e) {
      return null;
    }
  }

  public static void main(String[] args) {
    Statement statement = DBConnect.getInstall().get();
    if (statement != null) {
      System.out.println("hieenf");
    }
  }
}


