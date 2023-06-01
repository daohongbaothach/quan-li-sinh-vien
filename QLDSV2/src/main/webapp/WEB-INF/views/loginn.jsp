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
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
body{
    background-image: url(resources/images/background.png);
}
.main{
   
    display: flex;
    background-color: white;
    margin: 32px ;
    border-radius: 32px;
    margin-top: 64px;

}
.left{
    text-align: center;
    flex: 1;
    
}
.wrapper{
    max-width: 300px;
    min-height: 350px;
    margin: 80px auto;
    padding: 40px 30px 30px 30px;
    background-color: #ecf0f3;
    border-radius: 15px;
    box-shadow: 13px 13px 20px #cbced1, -13px -13px 20px #fff;
}
.btn{
    margin-top: 8px;
    margin-left: 77.5%;
    margin-bottom: 8px;
    color: #418FD7;
    background-color: white;
    border: 2px solid black;
    font-weight: bold;
    
}
.btn:hover{
    background-color: #418FD7;
    color: black;
    transition: 0.5s;
    border: blue 2px solid;
}
.wrapper{
    margin-left: 40px;
    margin-right: 40px;
    flex: 1;
}

.left img {
    width: 500px;
    height: 400px;
    margin-left: 40px;
    border-radius: 240px;

}
.left h1{
    margin-left: 60px;
    font-family: Arial, Helvetica, sans-serif;
    color: #418FD7;
}
.left p {
    font-size: 16px;
    font-family: Arial, Helvetica, sans-serif;
    color: #418FD7;
    font-weight: bold;
    margin-top: 40px;

}
.logo {
    width: 80px;
    margin: auto;
}

.logo img {
    width: 100%;
    height: 80px;
    object-fit: cover;
    border-radius: 50%;
    box-shadow: 0px 0px 3px #5f5f5f,
        0px 0px 0px 5px #ecf0f3,
        8px 8px 15px #a7aaa7,
        -8px -8px 15px #fff;
}

.wrapper .name {
    font-weight: 600;
    font-size: 1.4rem;
    letter-spacing: 1.3px;
    padding-left: 10px;
    color: #555;
}

.wrapper .form-field input {
    width: 100%;
    display: block;
    border: none;
    outline: none;
    background: none;
    font-size: 1.2rem;
    color: #666;
    padding: 10px 15px 10px 10px;
    /* border: 1px solid red; */
}

.wrapper .form-field {
    padding-left: 10px;
    margin-bottom: 20px;
    border-radius: 20px;
    box-shadow: inset 8px 8px 8px #cbced1, inset -8px -8px 8px #fff;
    display: flex;
}

.wrapper .form-field .fas {
    color: #555;
    size: 50px;
    margin:10px;
}

.wrapper .btn {
    box-shadow: none;
    width: 50%;
    margin: 40px 80px;
    height: 40px;
    background-color: #03A9F4;
    color: #fff;
    border-radius: 25px;
    box-shadow: 3px 3px 3px #b1b1b1,
        -3px -3px 3px #fff;
    letter-spacing: 1.3px;
}

.wrapper .btn:hover {
    background-color: #039BE5;
}

.wrapper a {
    text-decoration: none;
    font-size: 1.2rem;
    color: #03A9F4;
}
.wrapper .text{
    text-align: center;
    padding: 10px;
    font-size: 1.4rem;
}
.wrapper a:hover {
    color: #039BE5;
}

@media(max-width: 380px) {
    .wrapper {
        margin: 30px 20px;
        padding: 40px 15px 15px 15px;
    }
}
	</style>
</head>

<body>
${message}
${message2}
${message3}
    <div class="main">
        <div class="left">
            <h1> Học Viện Công Nghệ Bưu Chính Viễn Thông Cơ Sở TPHCM</h2>
                <img src="resources/images/ANH NEN PTIT.jpg" alt="">
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
                    <img src="resources/images/ptit_logo.png" alt="">
                </div>
                <div class="text">
                    PTIT
                </div>
                <form:form class="p-3 mt-3" action = "loginn.htm" method="post">
                    <div class="form-field d-flex align-items-center">
                        <span class="fas fa-user"></span>
                        <input name="id" placeholder="Tên đăng nhập"/>
                    </div>
                    <div class="form-field d-flex align-items-center">
                        <span class="fas fa-key"></span>
                        <input name="pw" type="password" placeholder="Mật khẩu"/>
                    </div>
                    <button class="btn">Đăng nhập</button>
                </form:form>
          </div>
    </div>

</body>
</html>