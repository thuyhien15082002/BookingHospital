package Model;

public class User {
  int user_id;
  String email;
  String password;
  String name;
  int role;
  String phone;

  public User(){};

  public User(int user_id, String email, String password, String name, int role, String phone) {
    this.user_id = user_id;
    this.email = email;
    this.password = password;
    this.name = name;
    this.role = role;
    this.phone = phone;
  }

  public int getUser_id() {
    return user_id;
  }

  public void setUser_id(int user_id) {
    this.user_id = user_id;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getRole() {
    return role;
  }

  public void setRole(int role) {
    this.role = role;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


}