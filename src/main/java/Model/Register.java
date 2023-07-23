package Model;

public class Register {

  String email;
  String password;
  String name;
  int role;
  String phone;
  int code;

  public Register(String email, String password, String name, int role, String phone, int code) {
    this.email = email;
    this.password = password;
    this.name = name;
    this.role = role;
    this.phone = phone;
    this.code = code;
  }

  public Register() {

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

  public int getCode() {
    return code;
  }

  public void setCode(int code) {
    this.code = code;
  }
}

