<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

        <form action="make-appointment" method="post" id="appointment-form">
            <div class="row">
                <div class="col-md-4 form-group">
                    <input type="text" name="name" class="form-control" id="name" placeholder="Họ tên"
                           data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                    <div class="validate"></div>
                </div>
                <div class="col-md-4 form-group mt-3 mt-md-0">
                    <input type="text" class="form-control" name="gender" id="gender" placeholder="Giới tính" required>
                    <div class="validate"></div>
                </div>
                <div class="col-md-4 form-group mt-3 mt-md-0">
                    <input type="tel" class="form-control" name="phone" id="phone" placeholder="Số điện thoại"
                           data-rule="minlen:4" data-msg="Please enter at least 4 chars" required >
                    <div class="validate"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group mt-3">
                    <input type="date" name="date" class="form-control datepicker" id="date"
                           placeholder="Ngày hẹn" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
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
                    <select name="doctor" id="doctor" class="form-select">
                        <option value="">Chọn bác sĩ</option>
                    </select>
                    <div class="validate"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 form-group mt-3">
                    <select name="time" id="time" class="form-select">
                        <!-- Options will be added here -->
                        <option value="">Chọn giờ</option>
                    </select>
                </div>
            </div>
            <div class="form-group mt-3">
                <textarea class="form-control" name="message" rows="5" id="message" placeholder="Triệu chứng (Nếu có)"></textarea>
                <div class="validate"></div>
            </div>

            <div class="text-center">
                <input type="hidden" name="userId" id="userId" value="${user.getUser_id()}">
                <button class="btn-primary" type="submit">Đặt lịch</button>
            </div>
        </form>

    </div>
</section><!-- End Appointment Section -->
<!-- Thêm thư viện SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
<script type="text/javascript">
  const departmentSelect = document.getElementById("department");
  const doctorSelect = document.getElementById("doctor");


  departmentSelect.addEventListener("change", function () {
    const selectedDepartmentId = departmentSelect.value;

    doctorSelect.innerHTML = '<option value="">Chọn bác sĩ</option>';


    // Gửi yêu cầu POST với dữ liệu specialistId tới servlet để lấy danh sách bác sĩ
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          const doctors = JSON.parse(xhr.responseText);
          doctors.forEach((doctor) => {
            const option = document.createElement("option");
            option.value = doctor.id;
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

    const timeSelect = document.getElementById("time");
  // Tạo danh sách các giờ từ 7 đến 16
  for (let hour = 0o7; hour <= 16; hour++) {
    const option = document.createElement("option");
    const formattedHour = hour.toString().padStart(2, '0');
    option.value = formattedHour  + ":00";
    option.text = formattedHour  + ":00";
    timeSelect.appendChild(option);
  }
</script>
<script type="text/javascript">

//     const appointmentForm = document.getElementById("appointment-form");

//     appointmentForm.addEventListener("submit", function (event) {
//         event.preventDefault(); // Ngăn chặn hành vi mặc định của form

//         const selectedDoctorId = doctorSelect.value; // Lấy giá trị id của bác sĩ đã chọn
//         const name = document.getElementById("name").value; // Lấy giá trị từ trường Họ tên
//         const gender = document.getElementById("gender").value; // Lấy giá trị từ trường Giới tính
//         const phone = document.getElementById("phone").value; // Lấy giá trị từ trường Số điện thoại
//         const date = document.getElementById("date").value; // Lấy giá trị từ trường Ngày hẹn
//         const time = timeSelect.value; // Lấy giá trị từ trường Giờ hẹn
//         const message = document.getElementById("message").value; // Lấy giá trị từ trường Triệu chứng
//         const userId = document.getElementById("userId").value;
//         // Tạo đối tượng JSON chứa thông tin của form và id bác sĩ đã chọn
//         const data = {
//             selectedDoctorId: selectedDoctorId,
//             name: name,
//             gender: gender,
//             phone: phone,
//             date: date,
//             time: time,
//             message: message,
//             userId : userId
//         };

//         // Gửi đối tượng JSON đến controller bằng yêu cầu AJAX
//         const xhr = new XMLHttpRequest();
//         xhr.onreadystatechange = function() {
//             if (xhr.readyState === XMLHttpRequest.DONE) {
//                 if (xhr.status === 200) {
//                     // Xử lý dữ liệu trả về từ controller nếu cần
//                     // console.log(xhr.responseText); // In dữ liệu trả về từ controller vào console
//                     window.location.href = "/appointment-success";
//                 } else if (xhr.status === 409){
//                     // Hiển thị thông báo lỗi cho người dùng
//                     alert("Ngày và giờ đã được đặt trước đó. Vui lòng chọn thời gian khác.");
//                     window.location.reload();
//                 }
//             }
//         };
//         xhr.open("POST", "/make-appointment", true); // Thay đổi đường dẫn /make-appointment thành đường dẫn đến controller xử lý yêu cầu
//         xhr.setRequestHeader("Content-type", "application/json");
//         xhr.send(JSON.stringify(data));
//     });
  const appointmentForm = document.getElementById("appointment-form");

  appointmentForm.addEventListener("submit", function (event) {
    event.preventDefault(); // Ngăn chặn hành vi mặc định của form

    const selectedDoctorId = doctorSelect.value; // Lấy giá trị id của bác sĩ đã chọn
    const name = document.getElementById("name").value; // Lấy giá trị từ trường Họ tên
    const gender = document.getElementById("gender").value; // Lấy giá trị từ trường Giới tính
    const phone = document.getElementById("phone").value; // Lấy giá trị từ trường Số điện thoại
    const date = document.getElementById("date").value; // Lấy giá trị từ trường Ngày hẹn
    const time = timeSelect.value; // Lấy giá trị từ trường Giờ hẹn
    const message = document.getElementById("message").value; // Lấy giá trị từ trường Triệu chứng
    const userId = document.getElementById("userId").value;
    // Tạo đối tượng JSON chứa thông tin của form và id bác sĩ đã chọn
    const data = {
      selectedDoctorId: selectedDoctorId,
      name: name,
      gender: gender,
      phone: phone,
      date: date,
      time: time,
      message: message,
      userId : userId
    };

    // Gửi đối tượng JSON đến controller bằng yêu cầu AJAX
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          // Xử lý dữ liệu trả về từ controller nếu cần
          // console.log(xhr.responseText); // In dữ liệu trả về từ controller vào console
          window.location.href = "/appointment-success";
        } else if (xhr.status === 409){
          // Hiển thị thông báo lỗi cho người dùng
          alert("Ngày và giờ đã được đặt trước đó. Vui lòng chọn thời gian khác.");
          window.location.reload();

        }
      }
    };
    xhr.open("POST", "/make-appointment", true); // Thay đổi đường dẫn /make-appointment thành đường dẫn đến controller xử lý yêu cầu
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(JSON.stringify(data));
  });

</script>


</body>
</html>