<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	 <!DOCTYPE html>
	 <html lang="en">
	 
	 <head>
		 <meta charset="UTF-8">
		 <meta http-equiv="X-UA-Compatible" content="IE=edge">
		 <meta name="viewport" content="width=device-width, initial-scale=1.0">
		 <title>Thêm, xóa, sửa sinh viên</title>
		 <base href="${pageContext.servletContext.contextPath}/">
		 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		 <link rel="stylesheet" href="resources/css/index.css">
         <style>
             body{
                 display: flex;
             }
	 
	 #name {
		 background-color: #343A40;
		 color: #FFFFFF;
		 padding: 8px;
         text-align: center;
	 }
	 
	 #input {
		 margin-bottom: 32px;
	 
	 }
	 
	 #inputLeft {
		margin:auto;
		 width: 70%;
	 }
	 
	 input {
		 padding: 4px;
		 outline: none;
         background-color: cornsilk;
	 }
	 #tablen {
    width: 90%;
    border-collapse: collapse;
    margin: auto;

}
	 #add {
		 padding: 4px 32px;
		 background-color: #28A745;
		 border: 1px solid #28A745;
		 cursor: pointer;
		 color: #FFFFFF;
		 transition: 0.5s;
	 }
	 
	 #add:hover {
		 background-color: #80f39b;
		 color: #beb8b8;
	 }
	 #output th {
	 
		 background-color: #343A40;
		 padding: 8px 32px 8px 8px;
		 border-bottom: 1px solid gray;
		 color: #FFFFFF;
		 background-color: #343A40;
	 
	 
	 }
	 
	 #output td {
		 text-align: center;
		 padding: 8px 32px 8px 0px;
		 border-bottom: 1px solid gray;
	 
	 }
	 
	 .update {
		 background-color: #80F39B;
	 }
	 
	 #del {
		 background-color: rgb(162, 14, 14);
		 padding: 4px 32px;
	 
		 border: 1px solid rgb(162, 14, 14);
		 cursor: pointer;
		 color: #FFFFFF;
		 transition: 0.5s;
		 margin-top: 4px;
		 margin-bottom: 4px;
	 }
	 
	 #del:hover {
		 background-color: red;
	 }
	 
	 #edit {
		 padding: 4px 32px;
		 background-color: #28A745;
		 border: 1px solid #28A745;
		 cursor: pointer;
		 color: #FFFFFF;
		 transition: 0.5s;
		 margin-top: 4px;
		 margin-bottom: 4px;
	 }
	 
	 #edit:hover {
		 background-color: #80f39b;
		 color: #beb8b8;
	 }
     .vertical{
         margin: 10px;
     }
     .horizontal{
         margin: 8px;
         display:flex;
         flex-direction: column;
     }
     .input-group-text{
         background-color: gray;
         color: white;
         width: 20%;
     }

      #iTable {
    
		width: 90%;
    border-collapse: collapse;
    margin: auto;
}

#iTable th {
    font-size: 16px;
    background-color: #343A40;
    padding: 8px 16px 8px 8px;
    border-bottom: 1px solid gray;
	text-align: center;
    color: #FFFFFF;
    background-color: #343A40;


}

#iTable td {
    font-size: 16px;
    text-align: center;
    padding: 8px 16px 8px 8px;
    border-bottom: 1px solid gray;


}

input {
	width: 80%;
    outline: none;
    border: none;
    text-align: center;
}
		 </style>
	 </head>
	
	 <body>
    
		 
		 <div class="vertical">
        
                    <p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> Xin chào ${quyen1.TK}${quyen2.TK}</p>
                    <hr>
        
                    <div class="btn"><a href="loginn.htm"><i class="fa fa-backward"></i> Trở về trang chủ</a></div>
                    <div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
         </div>
	<h2>${a }</h2>
    <div class="horizontal">
         <h1 id="name">TẠO TÀI KHOẢN</h1>
		 <div id="input">
			 <div id="inputLeft">
		
	            <td>${message1 }</td>

			 

			 <form method="post" action="taotk.htm">

			 	<h5>TẠO TÀI KHOẢN:</h5>
							 ${message }
						<div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Tên tài khoản (Mã) </span>
							 <input type="text" name="tk" class="form-control" id="basic-url" aria-describedby="basic-addon3">
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Mật khẩu </span>
							 <input type="text"name="mk"   class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <input type="hidden" name="malop" value="${malop }"  class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Loại tài khoản</span>
							  <select name = "quyen" class="form-select" aria-label="Default select example">
			                                <option selected value="1"> Quản lí </option> 
			                                 <option value="2" > Giảng viên </option> 
			                                 <option value="3" > Sinh viên </option> 
			                                 </select>
							 <br>
							 </div>
						 </div>
						<button name="btnAdd" class="btn btn-primary">Tạo</button>

						 </form>

         
	 
	 </body>
	 
	 </html>
	 