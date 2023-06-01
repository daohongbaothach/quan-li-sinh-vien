<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ĐĂNG NHẬP</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <link rel="stylesheet" href="resources/css/index.css">
</head>

<body>
${message}
${message2}
${message3}
    <div class="main">
        <div class="left">
            <h1> Học Viện Công Nghệ Bưu Chính Viễn Thông Cơ Sở TPHCM</h2>
                <img src="./ANH NEN PTIT.jpg" alt="">
                <p> Địa chỉ : Đường Man Thiện, P. Hiệp Phú, Q.9 TP Hồ Chí Minh <br>
                    ĐT: (028) 38297220; Fax: (028) 39105510 <br>
                    Website: https://ptithcm.edu.vn
                </p>
        </div>
        <div class="wrapper">
            
            <!-- <h1 class="form-heading">login Form</h1> -->
		<div class="login-form">
			<div class="main-div">
                <div class="logo">
                    <img src="https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-bird-symbols-png-logo-0.png" alt="">
                </div>
                <div class="text">
                    PTIT
                </div>
                <form:form class="p-3 mt-3" action = "loginn.htm" method="post">
                    <div class="form-field d-flex align-items-center">
                        <span class="fas fa-user"></span>
                        <form:input path="id" id="userName" placeholder="Username"/>
                    </div>
                    <div class="form-field d-flex align-items-center">
                        <span class="fas fa-key"></span>
                        <form:input path="pw" id="pwd" placeholder="Password"/>
                    </div>
                    <button class="btn">Login</button>
                </form:form>
                <div class="text ">
                    <a href="#">Forget password?</a> or <a href="#">Sign up</a>
                </div>
          </div>
    </div>

</body>