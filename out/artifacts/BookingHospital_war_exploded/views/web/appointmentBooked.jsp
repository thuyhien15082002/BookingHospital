<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content">
    <%
        HttpSession ss = request.getSession();
        User user = (User) ss.getAttribute("user");

    %>
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                <div class="profile-sidebar">
                    <div class="widget-profile pro-widget-content">
                        <div class="profile-info-widget">
                            <a href="#" class="booking-doc-img">
                                <img src="assets/img/patients/patient.jpg" alt="User Image">
                            </a>
                            <div class="profile-det-info">
                                <h3><%=user.getName()%>
                                </h3>
                                <div class="patient-details">
                                    <h5 class="mb-0"><i class="fas fa-map-marker-alt"></i><%=user.getEmail()%>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-widget">
                        <nav class="dashboard-menu">
                            <ul>
                                <li>
                                    <a href="profile">
                                        <i class="fas fa-user-cog"></i>
                                        <span>Hồ sơ</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="appointment-booked">
                                        <i class="fas fa-list-alt"></i>
                                        <span>Lịch đã đặt</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="change-password">
                                        <i class="fas fa-lock"></i>
                                        <span>Thay đổi mật khẩu</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="log-out">
                                        <i class="fas fa-sign-out-alt"></i>
                                        <span>Đăng xuất</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="col-md-7 col-lg-8 col-xl-9">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="mb-4 " style="font-size: 20px;font-weight: 700;color: green;">
                                    Booked Appointment
                                </h4>
                                <div class="tile">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table datanew">
                                                    <thead>
                                                    <tr>
                                                        <th>Mã lịch hẹn</th>
                                                        <th>Bác sĩ</th>
                                                        <th>Ngày đặt</th>
                                                        <th>Tên bệnh nhân</th>
                                                        <th>Số điện thoại</th>
                                                        <th>Giới tính</th>
                                                        <th>Trạng thái</th>
                                                        <th>Triệu chứng</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="a" items="${appointmentList}">
                                                        <tr>
                                                            <td class="text-bolds">#${a.id}</td>

                                                            <c:forEach var="d" items="${doctorList}">
                                                                <c:if test="${d.id == a.doctor_id}">
                                                                    <td>${d.name}</td>
                                                                </c:if>
                                                            </c:forEach>
                                                            <td>${a.appoint_date} <br> ${a.appoint_time}</td>
                                                            <td><span
                                                                    class="badges bg-lightgreen">${a.patient_name}</span>
                                                            </td>
                                                            <td>${a.phone}</td>
                                                            <td>${a.gender}</td>
                                                            <td><c:choose>
                                                                <c:when test="${a.status == 0}">
                                                                    <span class="text-info">Đang xử lý</span>
                                                                </c:when>
                                                                <c:when test="${a.status == 1}">
                                                                    <span class="text-success">Chấp nhận</span>
                                                                </c:when>
                                                                <c:when test="${a.status == 2}">
                                                                    <span class="text-danger">Từ chối</span>
                                                                </c:when>
                                                            </c:choose>
                                                            </td>
                                                            <td>${a.appoint_purpose}</td>
                                                        </tr>
                                                    </c:forEach>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
