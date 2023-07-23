
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<section class="vh-100" style="margin: 200px;">
    <div class="container-fluid">
        <div class="row" style="--bs-gutter-x:1rem;">
            <div class="col-sm-6 text-black">

                <div class="px-5 ms-xl-4">
                    <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
                    <span class="h1 fw-bold mb-0">Logo</span>
                </div>

                <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">



                    <form action="register-code" method="post" style="width: 30rem;">

                        <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Nhập mã nhận được ở email đăng ký tài khoản</h3>

                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example18">Mã số</label>
                            <input type="number" name="code" id="form2Example18" class="form-control form-control-lg" />

                        </div>
                        <c:if test="${not empty sessionScope.errorMessage}">
                            <p style="color: red;">${sessionScope.errorMessage}</p>
                        </c:if>
                        <div class="pt-1 mb-4">
                            <button class="btn btn-info btn-lg btn-block" type="submit">Xác thực</button>
                        </div>


                    </form>
                    <% request.getSession().removeAttribute("errorMessage"); %>

                </div>

            </div>
            <div class="col-sm-6 px-0 d-none d-sm-block">
                <img src="https://cdn.luatvietnam.vn/uploaded/Images/Original/2020/12/24/benh-vien_2808175558_2412092857.jpg"
                     alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
            </div>
        </div>
    </div>
</section>
</body>
</html>
