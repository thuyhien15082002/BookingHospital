<%@ page import="Model.Doctor" %>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    HttpSession ss = request.getSession();
    Doctor doctor = (Doctor) ss.getAttribute("doctor");
%>
<div class="col-md-7 col-lg-8 col-xl-9">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-12 col-lg-6">

                    <form action="doctor-changePassword" method="post">
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
                            <input type="hidden" value="${doctor.getId()}" name="id">
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
</body>
</html>
