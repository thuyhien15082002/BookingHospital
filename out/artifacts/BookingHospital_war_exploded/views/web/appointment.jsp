<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section id="appointment" class="appointment section-bg" style="margin-top: 100px;">
  <div class="container">

    <div class="section-title">
      <h2>Đặt lịch</h2>
      <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>
    </div>

    <form action="forms/appointment.php" method="post" role="form" class="php-email-form">
      <div class="row">
        <div class="col-md-4 form-group">
          <input type="text" name="name" class="form-control" id="name" placeholder="Họ tên" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
          <div class="validate"></div>
        </div>
        <div class="col-md-4 form-group mt-3 mt-md-0">
          <input type="email" class="form-control" name="email" id="email" placeholder="Email" data-rule="email" data-msg="Please enter a valid email">
          <div class="validate"></div>
        </div>
        <div class="col-md-4 form-group mt-3 mt-md-0">
          <input type="tel" class="form-control" name="phone" id="phone" placeholder="Số điện thoại" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
          <div class="validate"></div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 form-group mt-3">
          <input type="datetime" name="date" class="form-control datepicker" id="date" placeholder="Ngày hẹn" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
          <div class="validate"></div>
        </div>
        <div class="col-md-4 form-group mt-3">
          <select name="department" id="department" class="form-select">
            <option value="">Chọn khoa</option>
            <option value="Department 1">Department 1</option>
            <option value="Department 2">Department 2</option>
            <option value="Department 3">Department 3</option>
          </select>
          <div class="validate"></div>
        </div>
        <div class="col-md-4 form-group mt-3">
          <select name="doctor" id="doctor" class="form-select">
            <option value="">Chọn bác sĩ</option>
            <option value="Doctor 1">Doctor 1</option>
            <option value="Doctor 2">Doctor 2</option>
            <option value="Doctor 3">Doctor 3</option>
          </select>
          <div class="validate"></div>
        </div>
      </div>

      <div class="form-group mt-3">
        <textarea class="form-control" name="message" rows="5" placeholder="Triệu chứng (Nếu có)"></textarea>
        <div class="validate"></div>
      </div>
      <div class="mb-3">
        <div class="loading">Loading</div>
        <div class="error-message"></div>
        <div class="sent-message">Your appointment request has been sent successfully. Thank you!</div>
      </div>
      <div class="text-center"><button type="submit">Đặt lịch</button></div>
    </form>

  </div>
</section><!-- End Appointment Section -->
</body>
</html>
