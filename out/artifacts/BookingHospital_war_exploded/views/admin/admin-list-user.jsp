<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="card">
    <h5 class="card-header">Danh sách Khoa</h5>
    <button type="button" class="col-sm-2">
        <a href="admin-add-specialist">Thêm Khoa</a>
    </button>
    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Email</th>
                <th>Password</th>
                <th>Phone</th>
                <th>Vai trò</th>
                <th>Hành động</th>


            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <c:forEach items="${users}" var="s">


                <tr class="table-default">
                    <td style="width: 200px"><i class="fab fa-sketch fa-lg text-warning me-3"></i> <strong>${s.id}</strong></td>
                    <td style="width: 300px"><span class="badge bg-label-primary me-1">${s.name}</span></td>

                    <td style="width: 600px">${s.email}</td>
                    <td style="width: 600px">${s.password}</td>
                    <td style="width: 600px">${s.phone}</td>
                    <td style="width: 600px">1</td>
                    <td>
                        <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                    data-bs-toggle="dropdown">
                                <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#?id=${s.id}"><i
                                        class="bx bx-edit-alt me-1"></i> Edit</a>
                                <a class="dropdown-item" href="#?id=${s.id}"><i
                                        class="bx bx-trash me-1"></i> Delete</a>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
</body>
</html>
