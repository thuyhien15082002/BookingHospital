<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/13/2023
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content-wrapper">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Forms/</span> Sửa Khoa</h4>

        <!-- Basic Layout & Basic with Icons -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">Sửa Khoa</h5>
                        <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                        <form action="admin-edit-specialist" method="post">
                            <div class="row mb-3">
                                <input type="hidden" name="id" value="${s.id}">
                                <label class="col-sm-2 col-form-label" for="basic-icon-default-fullname">Tên Khoa</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                              <span id="basic-icon-default-fullname2" class="input-group-text"
                              ><i class="bx bx-user"></i
                              ></span>
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="basic-icon-default-fullname"
                                                placeholder="Thúy Hiền"
                                                aria-label="Thúy Hiền"
                                                aria-describedby="basic-icon-default-fullname2"
                                                name="name"
                                                value="${s.name}"
                                        />
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 form-label" for="basic-icon-default-message">Thông tin</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                              <span id="basic-icon-default-message2" class="input-group-text"
                              ><i class="bx bx-comment"></i
                              ></span>
                                        <textarea
                                                id="basic-icon-default-message"
                                                class="form-control"
                                                placeholder="Thông tin "
                                                aria-label="Thông tin"
                                                aria-describedby="basic-icon-default-message2"
                                                name="description"

                                        >${s.description}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- / Content -->



    <div class="content-backdrop fade"></div>
</div>
</body>
</html>
