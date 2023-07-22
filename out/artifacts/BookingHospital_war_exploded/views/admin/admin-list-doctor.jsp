<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/11/2023
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="card">
    <h5 class="card-header">Danh sách bác sĩ</h5>

    <div class="col-sm-2">
        <button type="button" class="btn btn-warning"><a href="admin-add-doctor">Thêm</a></button>
        <button type="button" class="btn btn-success"><a href="admin-sort">Sắp xếp</a></button>
    </div>

    <div class="table-responsive text-nowrap">
        <table class="table">
            <thead>
            <tr>
                <th>STT</th>
                <th>Họ và Tên</th>
                <th>Email</th>
                <th>SĐT</th>
                <th>Giới tính</th>
                <th>Ảnh</th>
                <th>Khoa</th>
                <th>Mô tả</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody class="table-border-bottom-0">
            <c:forEach items="${doctors}" var="d">


            <tr class="table-default">
                <td>${d.id}</td>
                <td><i class="fab fa-sketch fa-lg text-warning me-3"></i> <strong>${d.name}</strong></td>
                <td>${d.email}</td>
                <td>${d.phone}</td>

                    <td>${d.gender}</td>



                <td>
                    <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                        <li data-bs-toggle="tooltip" data-popup="tooltip-custom"
                            data-bs-placement="top" class="avatar avatar-xs pull-up"
                            title="Lilian Fuller">
                            <img src="${d.image}" alt="Avatar"
                                 class="rounded-circle" />
                        </li>

                    </ul>
                </td>
                <c:forEach items="${specialists}" var="s">
                    <c:if test="${d.specialist_id == s.id}">
                        <td><span class="badge bg-label-primary me-1">${s.name}</span></td>
                    </c:if>
                </c:forEach>

                <td><span class="badge bg-label-primary me-1">${d.intro}</span></td>
                <td>
                    <div class="dropdown">
                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                data-bs-toggle="dropdown">
                            <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="admin-edit-doctor?id=${d.id}"><i
                                    class="bx bx-edit-alt me-1"></i> Edit</a>
                            <a class="dropdown-item" href="admin-delete?id=${d.id}"><i
                                    class="bx bx-trash me-1"></i> Delete</a>
                        </div>
                    </div>
                </td>
            </tr
            </c:forEach>


            </tbody>
        </table>
    </div>
</div>
</body>
</html>
