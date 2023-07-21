<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content">
    <%
        HttpSession ss = request.getSession();
        User user = (User) ss.getAttribute("user");
        String name = user.getName();
        String phone = user.getPhone();
        String email = user.getEmail();
        int id = user.getUser_id();
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
                                <h3>Richard Wilson</h3>
                                <div class="patient-details">
                                    <h5><i class="fas fa-birthday-cake"></i> 24 Jul 1983, 38 years</h5>
                                    <h5 class="mb-0"><i class="fas fa-map-marker-alt"></i> Newyork, USA</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="dashboard-widget">
                        <nav class="dashboard-menu">
                            <ul>





                                <li>
                                    <a href="profile-settings.html">
                                        <i class="fas fa-user-cog"></i>
                                        <span>Hồ sơ</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fas fa-list-alt"></i>
                                        <span>Lịch đã đặt</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="change-password.html">
                                        <i class="fas fa-lock"></i>
                                        <span>Thay đổi mật khẩu</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
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

                        <form method="post" action="update-profile">
                            <div class="row">
                                <div class="col-12 col-md-12">
                                    <div class="mb-3">
                                        <div class="change-avatar">
                                            <div class="profile-img">
                                                <img src="assets/img/patients/patient.jpg" alt="User Image">
                                            </div>
                                            <div class="upload-img">
                                                <div class="change-photo-btn">
                                                    <span><i class="fa fa-upload"></i> Upload Photo</span>
                                                    <input type="file" class="upload">
                                                </div>
                                                <small class="form-text text-muted">Allowed JPG, GIF or PNG. Max
                                                    size of 2MB</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="id" value="<%=id%>">
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label>Full Name</label>
                                        <input type="text" class="form-control" value="<%=name%>" name="fullName" >
                                    </div>
                                </div>

<%--                                <div class="col-12 col-md-6">--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label>Date of Birth</label>--%>
<%--                                        <div class="cal-icon">--%>
<%--                                            <input type="text" class="form-control datetimepicker"--%>
<%--                                                   value="24-07-1983">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label>Email </label>
                                        <input type="email" class="form-control" value="<%=email%>" readonly>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6">
                                    <div class="mb-3">
                                        <label>Mobile</label>
                                        <input type="text" value="<%=phone%>" name="phone" class="form-control" >
                                    </div>
                                </div>
<%--                                <div class="col-12">--%>
<%--                                    <div class="mb-3">--%>
<%--                                        <label>Address</label>--%>
<%--                                        <input type="text" class="form-control" value="806 Twin Willow Lane">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                            </div>
                            <div class="submit-section">
                                <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
