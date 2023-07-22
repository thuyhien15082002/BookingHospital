<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/13/2023
  Time: 3:11 PM
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
        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Forms/</span> Thêm bác sĩ</h4>

        <!-- Basic Layout & Basic with Icons -->
        <div class="row">

            <div class="col-xl">
                <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h5 class="mb-0">Thêm Bác Sĩ</h5>
                        <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                        <form action="admin-add-doctor" method="post" enctype="multipart/form-data">

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-icon-default-fullname">Họ và Tên</label>
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
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-icon-default-email">Email</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                        <input
                                                type="text"
                                                id="basic-icon-default-email"
                                                class="form-control"
                                                placeholder="thien.123"
                                                aria-label="thien.123"
                                                aria-describedby="basic-icon-default-email2"
                                                name="email"
                                        />
                                        <span id="basic-icon-default-email2" class="input-group-text">@gmail.com</span>
                                    </div>
                                    <div class="form-text">Bạn có thể sử dụng các chữ cái, số và dấu chấm</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-icon-default-company">Mật Khẩu</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                              <span id="basic-icon-default" class="input-group-text"
                              ><i class="bx bx-buildings"></i
                              ></span>
                                        <input
                                                type="text"
                                                id="basic-icon-default-company"
                                                class="form-control"
                                                placeholder="ACME Inc."
                                                aria-label="ACME Inc."
                                                aria-describedby="basic-icon-default-company2"
                                                name="password"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 form-label">Giới tính</label>

                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <input type="radio" name="gender" value="Nam">Nam
                                        <div><p>-------------------------</p></div>
                                        <input type="radio" name="gender" value="Nữ">Nữ

                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="2"  name="role">
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-icon-default-company">SĐT</label>
                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                              <span id="basic-icon-default-company2" class="input-group-text"
                              ><i class="bx bx-buildings"></i
                              ></span>
                                        <input
                                                type="text"
<%--                                                id="basic-icon-default-company2"--%>
                                                class="form-control"
                                                placeholder="ACME Inc."
                                                aria-label="ACME Inc."
                                                aria-describedby="basic-icon-default-company2"
                                                name="phone"
                                        />
                                    </div>
                                </div>
                            </div>


                            <div class="row mb-3">
                                <label for="formFileMultiple" class="col-sm-2 form-label">Ảnh</label>

                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                              <span id="basic-icon-default-phone2" class="input-group-text"
                              ><i class="bx bx-image"></i
                              ></span>
                                        <input class="form-control" type="file" id="formFileMultiple" multiple name="image" />

                                    </div>
                                    <div class="form-text">Chọn 1 hoặc nhiều ảnh</div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="defaultSelect1" class="col-sm-2 form-label">Khoa</label>

                                <div class="col-sm-10">
                                    <div class="input-group input-group-merge">
                                        <select id="defaultSelect1" class="form-select" name="specialist_id">

                                            <c:forEach items="${specialists}" var="s">
                                                <option value="${s.id}" ${s.id == d.specialist_id? 'selected'
                                                        : '' }>${s.name}
                                            </c:forEach>

                                        </select>
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
                                                name="intro"
                                        ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-end">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Thêm</button>
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
