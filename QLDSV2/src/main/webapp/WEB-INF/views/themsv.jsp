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
	 
	 
	 #inputLeft {
		margin:auto;
		 width: 60%;
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
         width: 25%;
     }
	 #iTable {
    
		width: 160%;
    border-collapse: collapse;
    margin: auto;
	transform: translateX(-18%);

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
	width: 100%;
	height: 100%;
    outline: none;
    border: none;
	margin-left: 0px;
	text-align: center;

}

     
		 </style>
	 </head>
	
	 <body>
    
		 
		 <div class="vertical">
        
                    <p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> Xin chào ${quyen1.TK}${quyen2.TK}</p>
                    <hr>
        
                    <div class="btn"><a href="/QLDSV2/loginn.htm"><i class="fa fa-backward"></i> Trở về trang chủ</a></div>
                    <div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
         </div>

    <div class="horizontal">
         <h1 id="name">Cập nhật sinh viên</h1>
		 
		 <div id="inputLeft">
		
			<td>${message1 }</td>
			 <td><input type="hidden" name="maltc"  value="${user.maLTC }" ></a></td>
		 
		 <form:form action="themsv.htm" modelAttribute="maltc" method ="post">
		   
			 <div>
				 <label for="basic-url" class="form-label">Nhập thông tin tìm kiếm</label>
				
<%-- 					 <c:if test="${quyen1.maQuyen == '1' }"> --%>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon3">Mã lớp</span>
						<select name = "searchInput" class="form-control" id="basic-url" aria-describedby="basic-addon3" aria-label="Default select example">
							<c:forEach var="l" items="${lop }">
								  <option  ${l.maLop }>    ${l.maLop }</option>	
							 </c:forEach>
						  </select>
						<br>
					 </div>
<%-- 					</c:if> --%>
				
  
				
			 </div>
			 <button name="btnSearch" class="btn btn-primary">Tìm kiếm</button>
							 <br>
									 <br>
		   <div>

			</div>
		 </form:form>
		 <%-- 			  <c:if test="${quyen1.maQuyen == '1' }"><!-- neu quyen admin thi duoc nhap thoai mai --> --%>
		 <form method="post" action="themsv.htm">
		 <c:if test="${malop != null }">
			 <h5>Thêm sinh viên của lớp ${malop }:</h5>
						 
					<div>
						 <div class="input-group mb-3">
						 <span class="input-group-text" id="basic-addon3">MSSV</span>
						 <input type="text" name="masv1" class="form-control" id="basic-url" aria-describedby="basic-addon3">
					 </div>
					 <div>
						 <div class="input-group mb-3">
						 <span class="input-group-text" id="basic-addon3">Họ </span>
						 <input type="text"name="hosv1"   class="form-control" id="basic-url" aria-describedby="basic-addon3">
						 <input type="hidden" name="malop1" value="${malop }"  class="form-control" id="basic-url" aria-describedby="basic-addon3">
						 <br>
						 </div>
					 </div>
					 <div>
						 <div class="input-group mb-3">
						 <span class="input-group-text" id="basic-addon3">Tên</span>
						 <input type="text" name="tensv1"  class="form-control" id="basic-url" aria-describedby="basic-addon3">
						 <br>
						 </div>
					 </div>
					 <div>
						 <div class="input-group mb-3">
						 <span class="input-group-text" id="basic-addon3">Phái</span>
						  <select name = "phai1" class="form-select" aria-label="Default select example">
										<option selected value="True"> Nam </option> 
										 <option value="False" >Nữ
										 </option> 
										 </select>
						 <br>
						 </div>
					 </div>
					 <div>
						 <div class="input-group mb-3">
						 <span class="input-group-text" id="basic-addon3">Địa chỉ</span>
						 <input type="text" name="diachi1" class="form-control" id="basic-url" aria-describedby="basic-addon3">
						 <br>
						 </div>
						  <div>
						 <div class="input-group mb-3">
						 <span class="input-group-text" id="basic-addon3">Ngày sinh</span>
						 <input type="date" name="ngaysinh1" class="form-control" id="basic-url" aria-describedby="basic-addon3">
						 <br>
						 </div>
						  
						  
						 <button name="btnAdd" class="btn btn-primary">Thêm</button>
						 
					 </div>
					 <br>
					 </c:if>
					 </form>
					 </div>
		
		<form method="post" action="themsv.htm"> 
						
						<table id="iTable">
						<c:if test="${malop != null }">
						<h5>Chỉnh sửa thông tin sinh viên của lớp ${malop }:</h5>
									  <tr>
										  <th>STT</th>
										  <th>MSSV</th>
										  <th>Lớp</th>
										  <th>Họ</th>
										  <th>Tên</th>
										  <th>Phái</th>
										  <th>Địa chỉ</th>
										  <th>Ngày sinh</th>
		  
									  </tr>
								  </c:if>
							  <c:set var="i" value="${0}"/>
					   <c:forEach  var="sv" items="${sinhvien}"> 
						  
								  <tr>
												  <td>
													  <c:set var="i" value="${i + 1}" />${i}
												  </td>
												  <td>
												  <input type="hidden"name="masv"  value="${sv.maSV }" >
										  
												   ${sv.maSV }
												  </td>
												  <td>
												  <input type="hidden"name="malop"  value="${sv.maLop }" >
												   ${sv.maLop }
												  </td>
												  <td>
												   <input type="text"name="hosv"  value="${sv.hoSV }" >
												  </td>
												  <td>
												   <input type="text" name="tensv" value="${sv.tenSV }">
												  </td>
												  <td>
												   <select name = "phai" class="form-select" aria-label="Default select example" style="background-color:#E4E4E4; border: none;">
													  <option selected <c:if test ="${sv.phai == 'True'}"> value ="True"
														  </c:if>
														  <c:if test ="${sv.phai == 'False'}"> value ="False"
														  </c:if>
													   
													   >  
													   <c:if test ="${sv.phai == 'True'}">Nam</c:if> 
													   <c:if test ="${sv.phai == 'False'}">Nữ</c:if>
													   </option> 
													   <option  <c:if test ="${sv.phai == 'True'}"> value ="False"
														  </c:if>
														  <c:if test ="${sv.phai == 'False'}"> value ="True"
														  </c:if>
													   
													   >  
													   <c:if test ="${sv.phai == 'True'}">Nữ</c:if> 
													   <c:if test ="${sv.phai == 'False'}">Nam</c:if>
													   </option> 
													   </select>
												  </td>
												  <td>
												   <input type="text" name="diachi" value="${sv.diaChi }" >
												  </td>
												  <td>
												   <input type="date" name="ngaysinh" value="${sv.ngaySinh }" >
												  </td>
		  
									  
								  
									   </tr>
									   </c:forEach>
									   </table>
									   
									  
									  <br>
									
								  	<c:if test="${malop != null }">
									  <button name="btnUpdate" class="btn btn-primary">Cập nhật</button>
							  </c:if>
									  <%-- 					</c:if> --%> 
		</form>
			
	 
			 <p>${message }</p>
				 
		<table id="iTable">
                <form:form action="nhapdiem/nhap.htm" modelAttribute="user" method="post">
                  <tr> 
                    
               </tr> 
                <c:forEach  var="u" items="${users }">
                  <tr>
                         <td>${u.maLTC }</td>
                      <td>${u.maSV }</td>
                      <td>${u.DCC }</td>
                      <td>${u.DGK }</td>
                      <td>${u.DThi }</td>
                     
                  </tr>
                
                </c:forEach>
                </form:form>
         </table>   
			 
        </div>
    
           
    
    
         
	 
	 </body>
	 
	 </html>
	 