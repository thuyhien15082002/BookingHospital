<%@ page import="Model.User" %>
<%@ page import="javax.print.Doc" %>
<%@ page import="Model.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
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
                        <input type="hidden" name="id" value="${doctor.getId()}">
                        <div class="col-12 col-md-6">
                            <div class="mb-3">
                                <label>Full Name</label>
                                <input type="text" class="form-control" value="${doctor.getName()}" name="fullName" >
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="mb-3">
                                <label>Gender</label>
                                <input type="text" class="form-control" value="${doctor.getGender()}" name="gender" >
                            </div>
                        </div>

                        <%--                                    <div class="col-12 col-md-6">--%>
                        <%--                                        <div class="mb-3">--%>
                        <%--                                            <label>Date of Birth</label>--%>
                        <%--                                            <div class="cal-icon">--%>
                        <%--                                                <input type="text" class="form-control datetimepicker"--%>
                        <%--                                                       value="24-07-1983">--%>
                        <%--                                            </div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>

                        <div class="col-12 col-md-6">
                            <div class="mb-3">
                                <label>Email </label>
                                <input type="email" class="form-control" value="${doctor.getEmail()}" readonly>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="mb-3">
                                <label>Mobile</label>
                                <input type="text" value="${doctor.getPhone()}" name="phone" class="form-control" >
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="mb-3">
                                <label>Specialist</label>
                                <input type="text" value="${doctor.getSpecialist_id()}" name="specialist" class="form-control" >
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mb-3">
                                <label>Myself</label>
                                <input type="text" class="form-control" value="${doctor.getIntro()}">
                            </div>
                        </div>

                    </div>

                    <div class="submit-section">
                        <button type="submit" class="btn btn-primary submit-btn">Save Changes</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

</body>
</html>
