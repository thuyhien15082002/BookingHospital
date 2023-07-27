package Model;

import java.util.Date;
import java.sql.Time;

public class Appointment {
    int id;
    int user_id;
    int doctor_id;
    Date appoint_date;
    String appoint_time;
    String appoint_purpose;
    int status;
    String patient_name;
    String phone;
    String gender;

    public Appointment() {
    }

    public Appointment(int id, int user_id, int doctor_id, Date appoint_date, String appoint_time,
        String appoint_purpose,
        int status, String patient_name, String phone, String gender) {
        this.id = id;
        this.user_id = user_id;
        this.doctor_id = doctor_id;
        this.appoint_date = appoint_date;
        this.appoint_time = appoint_time;
        this.appoint_purpose = appoint_purpose;
        this.status = status;
        this.patient_name = patient_name;
        this.phone = phone;
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public Date getAppoint_date() {
        return appoint_date;
    }

    public void setAppoint_date(Date appoint_date) {
        this.appoint_date = appoint_date;
    }

    public String getAppoint_time() {
        return appoint_time;
    }

    public void setAppoint_time(String appoint_time) {
        this.appoint_time = appoint_time;
    }

    public String getAppoint_purpose() {
        return appoint_purpose;
    }

    public void setAppoint_purpose(String appoint_purpose) {
        this.appoint_purpose = appoint_purpose;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
