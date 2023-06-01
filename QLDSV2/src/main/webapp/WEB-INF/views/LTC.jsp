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
		 <title>Nhap Diem</title>
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
     
		 </style>
	 </head>
	
	 <body>
    
		 
		 <div class="vertical">
        
                    <p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> Xin chào ${quyen1.TK}${quyen2.TK}</p>
                    <hr>
        
                    <div class="btn"><a href="loginn.htm"><i class="fa fa-backward"></i> Trở về trang chủ</a></div>
                    <div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
         </div>

    <div class="horizontal">
         <h1 id="name">Thông tin các lớp tín chỉ</h1>
         <div id="input">
            <div id="inputLeft">
                <form:form action="/LTC.htm" modelAttribute="maltc" method ="get">
                        <div>
                            <label for="basic-url" class="form-label">Nhập thông tin để tìm kiếm</label>
                            <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Mã lớp tín chỉ</span>
                            <select name = "timLTC" class="form-control form-select" id="basic-url" aria-describedby="basic-addon3">
                                 <c:forEach var="l" items="${ltc }">
                                     
                                     <option  ${l.maLTC }>    ${l.maLTC }</option>
                                </c:forEach>
                             </select>
                            <br>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon3">Năm</span>
                        <input name = "timN" class="form-control" aria-label="Default select example">

                        <br>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Học kì</span>
                            <select name = "timHK" class="form-select" aria-label="Default select example">
                                <option selected>     1</option>
                                <option value="2">     2</option>
                              </select>
                            <br>
                            </div>
                            <button name="btnSearchLTC" class="btn btn-primary">Tìm kiếm</button>
                            <br>
                            <br>
                </form:form>
    
                <form method="post" action="/LTC.htm">
    
                    <c:if test="${quyen1.maQuyen =='1' }">
                    <c:forEach  var="user" items="${users}">
                    
                    
                        <div>
                        <label for="basic-url" class="form-label">Mã lớp tín chỉ: ${user.maLTC } </label>
                        <input type="hidden" name="maltc"  value="${user.maLTC }" >
                        </div>
                           <div>
                            <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">SVTT</span>
                            <input type="text" name="svtt" value="${user.SVTT }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                            <br>
                            </div>
                            <div>
                                <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">SVTD</span>
                                <input type="text" name="svtd" value="${user.SVTD }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                <br>
                                <br>
                                </div>
                            </div>
                            <div>
                                <label for="basic-url" class="form-label">Mã môn học: ${user.maMH }</label>
                                <input type="hidden" name="mamh" value="${user.maMH }" >
                            </div>
                            <div>
                                <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Học kì</span>
                                <input type="text" name="hocki" value="${user.hocKi }"  class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                <br>
                                </div>
                            </div>
                       
                            <div>
                                <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Năm</span>
                                <input  type="text" name="nam" value="${user.nam }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                <br>
                                </div>
                            </div>
                            <div>
                                <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Hệ số 1</span>
                                <input type="text" name="heso1" value="${user.heSo1 }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                <br>
                                </div>
                            </div>
                            <div>
                                <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Hệ số 2</span>
                                <input type="text" name="heso2" value="${user.heSo2}" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                <br>
                                <br>
                                </div>
                            </div>
                       
                            <div>
                                <label for="basic-url" class="form-label">Trạng thái mở: ${user.trangThai }</label>
                                 <!-- Dat trang thai mac dinh de ko loi -->
                                <input type="hidden" name="mamh" value="${user.maMH }" >
                            </div>
                               
                           
                            <div class="form-check">
                                <input type="checkbox" name="trangthai" value="False" class="form-check-input" id="defaultCheck1"
                                <c:if test = "${user.trangThai == 'False'}">
                                    checked ="checked"
                                </c:if>>
                                <label class="form-check-label" for="defaultCheck1">
                                  Khóa
                                </label>
                                <br>
                            </div>
                           
                            <div class="form-check">
                                <input type="checkbox" name="trangthai" value="True" class="form-check-input" id="defaultCheck1"
                                <c:if test = "${user.trangThai == 'True'}">
                                   checked ="checked"
                               </c:if>>
                                <label class="form-check-label" for="defaultCheck1">
                                  Mở
                                </label>
                            </div>
                    
                         <div>---------------------</div>

                     </c:forEach>
                     </c:if>
                        <button name="btnUpdate" class="btn btn-primary">Cập nhật</button>
                        <br>
                                <br>
                    
                </form>
                <p>${message }</p>
            <p>${message1 }</p>
            <p>${message2 }</p>
            <p>${message3 }</p>
                <div>
            </div>
           
    
        </div>
    </div>
         
	 
	 </body>
	 
	 </html>
	 