<%@ page import="Model.User" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    HttpSession ss = request.getSession();
    User user = (User) ss.getAttribute("user");
%>
<section id="make-appointment" class="appointment section-bg" style="margin-top: 100px;">
    <div class="container">
        <div class="section-title">
            <h2>Đặt lịch</h2>
            <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint
                consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat
                sit in iste officiis commodi quidem hic quas.</p>
        </div>

        <form action="make-appointment" method="post" id="appointment-form" >
            <div class="row">
                <div class="col-md-4 form-group">
                    <input type="text" name="name" class="form-control" id="name" placeholder="Họ tên"
                           data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                    <div class="validate"></div>
                </div>
                <div class="col-md-4 form-group mt-3 mt-md-0">
                    <input type="text" class="form-control" name="gender" id="gender" placeholder="Giới tính">
                    <div class="validate"></div>
                </div>
                <div class="col-md-4 form-group mt-3 mt-md-0">
                    <input type="tel" class="form-control" name="phone" id="phone" placeholder="Số điện thoại"
                           data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                    <div class="validate"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group mt-3">
                    <input type="date" name="date" class="form-control datepicker" id="date"
                           placeholder="Ngày hẹn" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                    <div class="validate"></div>
                </div>
                <div class="col-md-4 form-group mt-3">
                    <select name="department" id="department" class="form-select">
                        <option value="">Chọn khoa</option>
                        <c:forEach items="${specialists}" var="s">
                            <option value="${s.id}" name="specialist">${s.name}</option>
                        </c:forEach>
                    </select>
                    <div class="validate"></div>
                </div>
                <div class="col-md-4 form-group mt-3">
<<<<<<< HEAD
                    <select name="doctor" id="doctor" class="form-select" >
                        <option value="selectedDoctorId">Chọn bác sĩ</option>
=======
                    <select name="doctor" id="doctor" class="form-select">
                        <option value="" name="selectedDoctorId">Chọn bác sĩ</option>
>>>>>>> e14bc38919ca65f1bc00f13ba5667d92d70f1942
                    </select>
                    <div class="validate"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group mt-3">
                    <input type="time" name="time" class="form-control datepicker" id="time"
                           placeholder="Ngày hẹn" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                    <div class="validate"></div>
                </div>
            </div>
            <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" placeholder="Triệu chứng (Nếu có)"></textarea>
                <div class="validate"></div>
            </div>



            <div class="text-center">
                <button type="submit">Đặt lịch</button>
            </div>
        </form>

    </div>
</section><!-- End Appointment Section -->

<script type="text/javascript">
    const departmentSelect = document.getElementById("department");
    const doctorSelect = document.getElementById("doctor");

    departmentSelect.addEventListener("change", function () {
        const selectedDepartmentId = parseInt(departmentSelect.value);

<<<<<<< HEAD
        doctorSelect.innerHTML = '<option value="selectedDoctorId">Chọn bác sĩ</option>';
=======
        doctorSelect.innerHTML = '<option value="" name="selectedDoctorId">Chọn bác sĩ</option>';
>>>>>>> e14bc38919ca65f1bc00f13ba5667d92d70f1942

        // Gửi yêu cầu POST với dữ liệu specialistId tới servlet để lấy danh sách bác sĩ
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const doctors = JSON.parse(xhr.responseText);
                    doctors.forEach((doctor) => {
                        const option = document.createElement("option");
                        option.value = doctor.name;
                        option.text = doctor.name;
                        doctorSelect.appendChild(option);
                    });
                } else {
                    console.error("Error fetching doctors data");
                }
            }
        };
        xhr.open("POST", "/appointment", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("specialistId=" + selectedDepartmentId);
    });

</script>
<script type="text/javascript">
    // Lắng nghe sự kiện onchange khi người dùng chọn bác sĩ
    doctorSelect.addEventListener("change", function () {
        const selectedDoctorId = parseInt(doctorSelect.value);

        // Gửi giá trị id của bác sĩ tới controller bằng yêu cầu AJAX
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Xử lý dữ liệu trả về từ controller nếu cần
                    console.log(xhr.responseText); // In dữ liệu trả về từ controller vào console
                } else {
                    console.error("Error sending selected doctor data to server");
                }
            }
        };
        xhr.open("POST", "/make-appointment", true); // Thay đổi đường dẫn /selected-doctor thành đường dẫn đến controller xử lý yêu cầu của bạn
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("selectedDoctorId=" + selectedDoctorId);
    });
    // Lắng nghe sự kiện onclick khi người dùng click nút "Đặt lịch"
    const makeAppointmentButton = document.getElementById("make-appointment-button");
    makeAppointmentButton.addEventListener("click", function () {
        const form = document.getElementById("appointment-form");
        const formData = new FormData(form);

        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Xử lý phản hồi từ controller nếu cần
                    console.log(xhr.responseText); // In phản hồi từ controller vào console
                } else {
                    console.error("Error making appointment");
                }
            }
        };
        xhr.open("POST", "/make-appointment", true);
        xhr.send(formData);
    });
</script>


</body>
</html>
