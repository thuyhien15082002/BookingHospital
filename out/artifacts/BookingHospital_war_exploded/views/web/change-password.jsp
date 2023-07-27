<%@ page import="Model.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/23/2023
  Time: 8:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
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
                                <h3><%=user.getName()%></h3>
                                <div class="patient-details">
                                    <h5 class="mb-0"><i class="fas fa-map-marker-alt"></i><%=user.getEmail()%></h5>
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
                            <div class="col-md-12 col-lg-6">

                                <form action="change-password" method="post">
                                    <div class="mb-3">
                                        <label class="mb-2">Mật khẩu cũ</label>
                                        <input type="password" class="form-control" name="old-password">
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2">Mật khẩu mới</label>
                                        <input type="password" class="form-control" name="new-password">
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-2">Xác nhận mật khẩu</label>
                                        <input type="password" class="form-control" name="confirm-password">
                                    </div>
                                    <div class="submit-section">
                                        <input type="hidden" value="${user.getUser_id()}" name="id">
                                        <button type="submit" class="btn btn-primary submit-btn"> Lưu thay đổi </button>
                                    </div>
                                    <div class="mb-3" style="color: red;font-size: 20px;">${error1}</div>
                                    <div class="mb-3" style="color: red;font-size: 20px;">${error2}</div>
                                    <div class="mb-3" style="color: red;font-size: 20px;">${success}</div>
                                    <div class="mb-3" style="color: red;font-size: 20px;">${failure}</div>
                                </form>

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
