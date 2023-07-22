<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 7/11/2023
  Time: 5:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html
        lang="en"
        class="light-style layout-menu-fixed"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="../assets/"
        data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Admin</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="template/admin/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
            rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="template/admin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="template/admin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="template/admin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="template/admin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="template/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="template/admin/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="template/admin/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="template/admin/assets/js/config.js"></script>
    <style>
      .menu-inner py-1 .menu-item {

      }

      .menu-inner py-1 .menu-item active {

      }
    </style>
</head>
<body>
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

<%@include file="/common/admin/header.jsp"%>
    <div class="layout-page">
        <%@include file="/common/admin/nav.jsp"%>

<div>
    <dec:body/>
</div>
    </div>
    </div>
</div>




<script src="template/admin/assets/vendor/libs/jquery/jquery.js"></script>
<script src="template/admin/assets/vendor/libs/popper/popper.js"></script>
<script src="template/admin/assets/vendor/js/bootstrap.js"></script>
<script src="template/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="template/admin/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="template/admin/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="template/admin/assets/js/main.js"></script>

<!-- Page JS -->
<script src="template/admin/assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<script>
  const a = document.querySelectorAll('.menu-item');

  a.forEach(menuItem => {
    menuItem.addEventListener('click', () => {

      a.forEach(menuItem => {
        menuItem.classList.remove('active');


      });

      menuItem.classList.add('active');
    });
  });

</script>
</body>
</html>
