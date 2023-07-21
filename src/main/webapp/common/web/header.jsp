<%@ page import="Model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- ======= Top Bar ======= -->
<div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex justify-content-between">
        <div class="contact-info d-flex align-items-center">
            <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">contact@example.com</a>
            <i class="bi bi-phone"></i> +1 5589 55488 55
        </div>
        <div class="d-none d-lg-flex social-links align-items-center">
            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>
    </div>
</div>

<%
    HttpSession ss = request.getSession();
    User user = (User)ss.getAttribute("user");
%>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

        <h1 class="logo me-auto"><a href="web-home">Medilab</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto" href="#hero">Trang chủ</a></li>
                <li><a class="nav-link scrollto" href="#about">Giới thiệu</a></li>
                <li><a class="nav-link scrollto" href="#departments">Chuyên Khoa</a></li>
                <li><a class="nav-link scrollto" href="#doctors">Bác sĩ</a></li>
                <c:if test="${not empty user}">
                    <li class="dropdown"><a href="#"><span>${user.getName()}</span><i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="profile">Thông tin tài khoản</a></li>
                            <li><a href="log-out">Đăng xuất</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${empty user}">
                    <li class="dropdown"><a href="#"><span>Tài khoản</span><i class="bi bi-chevron-down"></i></a>
                        <ul>
                            <li><a href="#">Thông tin tài khoản</a></li>
                                <%--                        <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>--%>
                                <%--                            <ul>--%>
                                <%--                                <li><a href="#">Deep Drop Down 1</a></li>--%>
                                <%--                                <li><a href="#">Deep Drop Down 2</a></li>--%>
                                <%--                                <li><a href="#">Deep Drop Down 3</a></li>--%>
                                <%--                                <li><a href="#">Deep Drop Down 4</a></li>--%>
                                <%--                                <li><a href="#">Deep Drop Down 5</a></li>--%>
                                <%--                            </ul>--%>
                                <%--                        </li>--%>
                            <li><a href="log-in">Đăng nhập</a></li>
                        </ul>
                    </li>
                </c:if>

                <li><a class="nav-link scrollto" href="#contact">Liên hệ</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

        <a href="appointment.html" class="appointment-btn scrollto"><span class="d-none d-md-inline">Đặt</span> lịch</a>

    </div>
</header><!-- End Header -->

