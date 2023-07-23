<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-md-7 col-lg-8 col-xl-9">
    <div class="row">
        <div class="col-md-12">
            <div class="card dash-card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12 col-lg-4">
                            <div class="dash-widget dct-border-rht">
                                <div class="circle-bar circle-bar1">
                                    <div class="circle-graph1" data-percent="75">
                                        <img src="assets/img/icon-01.png" class="img-fluid"
                                             alt="patient">
                                    </div>
                                </div>
                                <div class="dash-widget-info">
                                    <h6>Total Patient</h6>
                                    <h3>1500</h3>
                                    <p class="text-muted">Till Today</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="dash-widget dct-border-rht">
                                <div class="circle-bar circle-bar2">
                                    <div class="circle-graph2" data-percent="65">
                                        <img src="assets/img/icon-02.png" class="img-fluid"
                                             alt="Patient">
                                    </div>
                                </div>
                                <div class="dash-widget-info">
                                    <h6>Today Patient</h6>
                                    <h3>160</h3>
                                    <p class="text-muted">06, Nov 2023</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="dash-widget">
                                <div class="circle-bar circle-bar3">
                                    <div class="circle-graph3" data-percent="50">
                                        <img src="assets/img/icon-03.png" class="img-fluid"
                                             alt="Patient">
                                    </div>
                                </div>
                                <div class="dash-widget-info">
                                    <h6>Appoinments</h6>
                                    <h3>85</h3>
                                    <p class="text-muted">06, Apr 2023</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h4 class="mb-4">Patient Appoinment</h4>
            <div class="appointment-tab">

                <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded">
                    <li class="nav-item">
                        <a class="nav-link active" href="#upcoming-appointments"
                           data-bs-toggle="tab">Upcoming</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#today-appointments" data-bs-toggle="tab">Today</a>
                    </li>
                </ul>

                <div class="tab-content">

                    <div class="tab-pane show active" id="upcoming-appointments">
                        <div class="card card-table mb-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0">
                                        <thead>
                                        <tr>
                                            <th>Tên bệnh nhân</th>
                                            <th>Ngày hẹn</th>
                                            <th>Triệu chứng</th>
                                            <th>Số điện thoại</th>
                                            <th>Giới tính</th>
                                            <th>Trạng thái</th>
                                            <th>Tác vụ</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="a" items="${listAppoints}">
                                            <tr>
                                                <td>
                                                    <h2 class="table-avatar">
                                                        <a href="patient-profile.html">${a.patient_name}
                                                            <span>Mã tài khoản: #${a.user_id}</span></a>
                                                    </h2>
                                                </td>
                                                <td>${a.appoint_date} <span class="d-block text-info">${a.appoint_time}</span></td>
                                                <td style="min-width: 250px; max-width: 350px; white-space: pre-wrap;">
                                                    ${a.appoint_purpose}
                                                </td>
                                                <td>${a.phone}</td>
                                                <td>${a.gender}</td>
                                                <td>
                                                    <input type="hidden" value="${a.status}" name="currentStatus" />
                                                    <select name="newStatus">
                                                        <c:forEach var="option" items="${['Đang xử lý', 'Chấp nhận','Không chấp nhận']}">
                                                            <option value="${option}">${option}</option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                                <td>
                                                    <div class="table-action">

                                                        <button
                                                           class="btn btn-sm bg-success-light">
                                                            <i class="fas fa-edit"></i> Cập nhật
                                                        </button>
                                                        <button
                                                           class="btn btn-sm bg-danger-light">
                                                            <i class="fas fa-times"></i> Xóa
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="tab-pane" id="today-appointments">
                        <div class="card card-table mb-0">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover table-center mb-0">
                                        <thead>
                                        <tr>
                                            <th>Patient Name</th>
                                            <th>Appt Date</th>
                                            <th>Purpose</th>
                                            <th>Type</th>
                                            <th>Paid Amount</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="patient-profile.html"
                                                       class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="assets/img/patients/patient6.jpg"
                                                            alt="User Image"></a>
                                                    <a href="patient-profile.html">Elsie Gilley
                                                        <span>#PT0006</span></a>
                                                </h2>
                                            </td>
                                            <td>14 Nov 2023 <span class="d-block text-info">6.00
                                                                        PM</span></td>
                                            <td>Fever</td>
                                            <td>Old Patient</td>
                                            <td>$300</td>
                                            <td>
                                                <div class="table-action">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-info-light">
                                                        <i class="far fa-eye"></i> View
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-success-light">
                                                        <i class="fas fa-check"></i> Accept
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-times"></i> Cancel
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="patient-profile.html"
                                                       class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="assets/img/patients/patient7.jpg"
                                                            alt="User Image"></a>
                                                    <a href="patient-profile.html">Joan Gardner
                                                        <span>#PT0006</span></a>
                                                </h2>
                                            </td>
                                            <td>14 Nov 2023 <span class="d-block text-info">5.00
                                                                        PM</span></td>
                                            <td>General</td>
                                            <td>Old Patient</td>
                                            <td>$100</td>
                                            <td>
                                                <div class="table-action">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-info-light">
                                                        <i class="far fa-eye"></i> View
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-success-light">
                                                        <i class="fas fa-check"></i> Accept
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-times"></i> Cancel
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="patient-profile.html"
                                                       class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="assets/img/patients/patient8.jpg"
                                                            alt="User Image"></a>
                                                    <a href="patient-profile.html">Daniel Griffing
                                                        <span>#PT0007</span></a>
                                                </h2>
                                            </td>
                                            <td>14 Nov 2023 <span class="d-block text-info">3.00
                                                                        PM</span></td>
                                            <td>General</td>
                                            <td>New Patient</td>
                                            <td>$75</td>
                                            <td>
                                                <div class="table-action">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-info-light">
                                                        <i class="far fa-eye"></i> View
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-success-light">
                                                        <i class="fas fa-check"></i> Accept
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-times"></i> Cancel
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="patient-profile.html"
                                                       class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="assets/img/patients/patient9.jpg"
                                                            alt="User Image"></a>
                                                    <a href="patient-profile.html">Walter Roberson
                                                        <span>#PT0008</span></a>
                                                </h2>
                                            </td>
                                            <td>14 Nov 2023 <span class="d-block text-info">1.00
                                                                        PM</span></td>
                                            <td>General</td>
                                            <td>Old Patient</td>
                                            <td>$350</td>
                                            <td>
                                                <div class="table-action">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-info-light">
                                                        <i class="far fa-eye"></i> View
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-success-light">
                                                        <i class="fas fa-check"></i> Accept
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-times"></i> Cancel
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="patient-profile.html"
                                                       class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="assets/img/patients/patient10.jpg"
                                                            alt="User Image"></a>
                                                    <a href="patient-profile.html">Robert Rhodes
                                                        <span>#PT0010</span></a>
                                                </h2>
                                            </td>
                                            <td>14 Nov 2023 <span class="d-block text-info">10.00
                                                                        AM</span></td>
                                            <td>General</td>
                                            <td>New Patient</td>
                                            <td>$175</td>
                                            <td>
                                                <div class="table-action">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-info-light">
                                                        <i class="far fa-eye"></i> View
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-success-light">
                                                        <i class="fas fa-check"></i> Accept
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-times"></i> Cancel
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h2 class="table-avatar">
                                                    <a href="patient-profile.html"
                                                       class="avatar avatar-sm me-2"><img
                                                            class="avatar-img rounded-circle"
                                                            src="assets/img/patients/patient11.jpg"
                                                            alt="User Image"></a>
                                                    <a href="patient-profile.html">Harry Williams
                                                        <span>#PT0011</span></a>
                                                </h2>
                                            </td>
                                            <td>14 Nov 2023 <span class="d-block text-info">11.00
                                                                        AM</span></td>
                                            <td>General</td>
                                            <td>New Patient</td>
                                            <td>$450</td>
                                            <td>
                                                <div class="table-action">
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-info-light">
                                                        <i class="far fa-eye"></i> View
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-success-light">
                                                        <i class="fas fa-check"></i> Accept
                                                    </a>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-sm bg-danger-light">
                                                        <i class="fas fa-times"></i> Cancel
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
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
</body>
</html>
