<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<main class="container" style="margin-top: 200px;">
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table datanew">
                                <thead>
                                <tr>
                                    <th>Mã lịch hẹn</th>
                                    <th>Mã tài khoản</th>
                                    <th>Ngày đặt</th>
                                    <th>Tên bệnh nhân</th>
                                    <th>Số điện thoại</th>
                                    <th>Ngày sinh</th>
                                    <th>Giới tính</th>
                                    <th>Ghi chú</th>
                                    <th>Trạng thái</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>

                                    <td class="text-bolds">#30</td>
                                    <td>#20</td>
                                    <td>19 Nov 2022</td>
                                    <td><span class="badges bg-lightgreen">NVA</span></td>
                                    <td>0901172380</td>
                                    <td>19 Nov 2022</td>
                                    <td>120</td>
                                    <td>550</td>
                                    <td><span class="badges bg-lightgreen">Paid</span></td>
                                    <td>
                                        <a class="me-3" href="editpurchase.html">
                                            <img src="assets/img/icons/edit.svg" alt="img">
                                        </a>
                                        <a class="me-3 confirm-text" href="javascript:void(0);">
                                            <img src="assets/img/icons/delete.svg" alt="img">
                                        </a>
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
</main>
</body>
</html>
