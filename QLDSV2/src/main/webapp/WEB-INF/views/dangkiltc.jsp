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
		 <title>Nhập điểm</title>
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
         <h1 id="name">Nhập điểm</h1>
		 <div id="input">
			 <div id="inputLeft">
		
	            <td>${message1 }</td>
				 <td><input type="hidden" name="maltc"  value="${user.maLTC }" ></a></td>
			 
			 <form:form action="nhapdiem/nhap.htm" modelAttribute="maltc" method ="post">
			   
				 <div>
					 <label for="basic-url" class="form-label">Nhập thông tin tìm kiếm</label>
					
					 <c:if test="${quyen1.maQuyen == '1' }">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Mã lớp tín chỉ</span>
                            <select name = "searchInput" class="form-control" id="basic-url" aria-describedby="basic-addon3" aria-label="Default select example">
                                <c:forEach var="l" items="${ltc }">
							  		<option  ${l.maLTC }>    ${l.maLTC }</option>	
								 </c:forEach>
                              </select>
                            <br>
                         </div>
					</c:if>
					
						<c:if test="${quyen2.maQuyen == '2' }">
                              <div class="input-group mb-3">
                                <span class="input-group-text" id="basic-addon3">Mã lớp tín chỉ</span>
                                <select name = "searchInput2" class="form-control" id="basic-url" aria-describedby="basic-addon3" aria-label="Default select example">
                                    <c:forEach var="l" items="${ltcgv }">
							  		<option  ${l.maLTC }>    ${l.maLTC }</option>
							  		
								 </c:forEach>
                                  </select>
                                <br>
                             </div>
						</c:if>
							  
					
				 </div>
				 <button name="btnSearch" class="btn btn-primary">Tìm kiếm</button>
								 <br>
										 <br>
			   <div>

				</div>
			 </form:form>
			 <form method="post" action="nhapdiem/nhap.htm">
			  <c:if test="${quyen1.maQuyen == '1' }"><!-- neu quyen admin thi duoc nhap thoai mai -->
			 <c:forEach  var="diem" items="${nhapdiem}"> 
					
						 <div>
							 <label for="basic-url" class="form-label">Mã lớp tín chỉ: ${diem.maLTC } </label>
							 <input type="hidden" name="maltc"  value="${diem.maLTC }" >
						 </div>
						 <div>
							 <label for="basic-url" class="form-label">Mã số sinh viên: ${diem.maSV } </label>
							 <input type="hidden" name="masv" value="${diem.maSV }">
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Điểm chuyên cần</span>
							 <input type="text"name="dcc"  value="${diem.DCC }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Điểm giữa kì</span>
							 <input type="text" name="dgk" value="${diem.DGK }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Điểm thi</span>
							 <input type="text" name="dthi" value="${diem.DThi }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Hủy đăng kí</span>
							 <input type="text" name="huydk" value="${diem.huyDK }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
							<div>--------------------------------------------------------------------------------------------------------------------------------------</div>
							</c:forEach>
					</c:if>
					 <c:if test ="${quyen2.maQuyen =='2' }"><!-- neu quyen gv va lop chua khoa thi moi duoc nhap diem -->
					 <c:forEach  var="diem" items="${nhapdiem2.lopTinChiE.dangKiLTCE}"> 
					 <c:if test = "${diem.lopTinChiE.trangThai =='True' }">
					 <div>

						 <div>
							 <label for="basic-url" class="form-label">Mã lớp tín chỉ: ${diem.maLTC } </label>
							 <input type="hidden" name="maltc"  value="${diem.maLTC }" >
						 </div>
						 <div>
							 <label for="basic-url" class="form-label">Mã số sinh viên: ${diem.maSV } </label>
							 <input type="hidden" name="masv" value="${diem.maSV }">
						 </div>
				 
							
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Điểm chuyên cần</span>
							 <input type="text" name="dcc"  value="${diem.DCC }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Điểm giữa kì</span>
							 <input type="text" name="dgk" value="${diem.DGK }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Điểm thi</span>
							 <input type="text" name="dthi" value="${diem.DThi }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
						 <div>
							 <div class="input-group mb-3">
							 <span class="input-group-text" id="basic-addon3">Hủy đăng kí</span>
							 <input type="text" name="huydk" value="${diem.huyDK }" class="form-control" id="basic-url" aria-describedby="basic-addon3">
							 <br>
							 </div>
						 </div>
							<div>--------------------------------------------------------------------------------------------------------------------------------------</div>
						</c:if>
						 <c:if test = "${diem.lopTinChiE.trangThai =='False' }">
					
						<div style=" font-size: 22px;text-align: center;color: red;">Bạn không thể nhập điểm cho lớp tín chỉ này, vui lòng liên hệ admin!!!</div>
                        <br>
                        <table id="table">
							<th>Mã lớp tín chỉ</th>
							<td>${diem.maLTC }</td>
						</tr>
						<tr>
							<th>Mã số sinh viên</th>
							<td>${diem.maSV }</td>
						</tr>
						<tr>
							<th>Điểm chuyên cần</th>
							<td>${diem.DCC }</td>
						</tr>
						<tr>
							<th>Điểm giữa kì</th>
							<td>${diem.DGK }</td>
						</tr>
						<tr>
							<th>Điểm thi</th>
							<td>${diem.DThi }</td>
						</tr>
	
					</table>
                    
                        </div>
						 
						 </c:if>
						</c:forEach>
						</c:if>
					
			
		
				 <button name="btnUpdate" class="btn btn-primary">Cập nhật</button>
				 <br>
						 <br>
			 </form>
		
	 
			 <p>${message }</p>
				 
			   
			 </div>
        </div>
        <div id="output">
            <table id="tablen">
                <form:form action="nhapdiem/nhap.htm" modelAttribute="user" method="post">
                 <tr>
                     <th> Lớp tín chỉ </th>
                     <th> Mã số sinh viên </th>
                     <th> Điểm chuyên cần </th>
                     <th>Điểm giữa kì</th>
                     <th>Điểm thi</th>
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
    </div>
         
	 
	 </body>
	 
	 </html>
	 