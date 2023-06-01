<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	 <%@taglib prefix="tg" tagdir="/WEB-INF/tags" %>
	
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
	width: 90%;
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
         <h1 id="name">Nhập điểm</h1>
		 
			 <div id="inputLeft">
		
	            <td>${message1 }</td>
				 <td><input type="hidden" name="maltc"  value="${user.maLTC }" ></a></td>
			 
			 <form:form action="nhapdiem/nhap.htm" modelAttribute="maltc" method ="get">
			   
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
			</div>
		
			 <form method="post" action="nhapdiem/nhap.htm">
			  <c:if test="${quyen1.maQuyen == '1' }"><!-- neu quyen admin thi duoc nhap thoai mai -->
			  		<table id="iTable">
			  		<tr>
			  			<c:set var="i" value="${0}" />
			  			<th>STT</th>
						<th>Lớp tín chỉ</th>
						<th>Mã số sinh viên</th>
						<th>Điểm chuyên cần</th>
						<th>Điểm giữa kỳ</th>
						<th>Điểm thi</th>
					</tr>
					
			 <c:forEach  var="diem" items="${nhapdiem}"> 
				
					<c:set var="i" value="${i+1}" />
					<tr>
						<td>${i}</td>
						<td>${diem.maLTC }
							<input type="hidden" name="maltc"  value="${diem.maLTC }" >
						</td>
						<td>${diem.maSV }
							<input type="hidden" name="masv" value="${diem.maSV }">
						</td>
						<td>
							<input type="text" name="dcc"  value="${diem.DCC }">
						</td>
						<td>
							<input type="text" name="dgk" value="${diem.DGK }">
						</td>
						<td>
							<input type="text" name="dthi" value="${diem.DThi }">
						</td>

					</tr>
					</c:forEach>
				   
				</table>
			</c:if>
			 <c:if test ="${quyen2.maQuyen =='2' }"><!-- neu quyen gv va lop chua khoa thi moi duoc nhap diem -->
					 <table id="iTable">
					 	<tr>
					 	<c:if test="${nhapdiem2 != null }">
					 			<c:set var="i" value="${0}" />
					 			<th>STT</th>
								<th>Lớp tín chỉ</th>
								<th>Mã số sinh viên</th>
								<th>Điểm chuyên cần</th>
								<th>Điểm giữa kỳ</th>
								<th>Điểm thi</th>
								</c:if>
							</tr>
					
					 <c:forEach  var="diem" items="${nhapdiem2.lopTinChiE.dangKiLTCE}"> 
					 	
					 <c:if test = "${diem.lopTinChiE.trangThai =='True' }">

					
							<c:set var="i" value="${i+1}" />
							<tr>
								<td>${i}</td>
								<td>${diem.maLTC }
									<input type="hidden" name="maltc"  value="${diem.maLTC }" >
								</td>
								<td>${diem.maSV }
									<input type="hidden" name="masv" value="${diem.maSV }">
								</td>
								<td>
									<input type="text" name="dcc"  value="${diem.DCC }">
								</td>
								<td>
									<input type="text" name="dgk" value="${diem.DGK }">
								</td>
								<td>
									<input type="text" name="dthi" value="${diem.DThi }">
								</td>

							</tr>
							</c:if>
						</c:forEach>
						   
						</table>
						
						 
						 
							
						</c:if>
						 <c:if test = "${diem.lopTinChiE.trangThai =='False' }">
					
						<div style=" font-size: 22px;text-align: center;color: red;">Bạn không thể nhập điểm cho lớp tín chỉ này, vui lòng liên hệ admin!!!</div>
                        <br>
                        <table id="table">
                        <tr>
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
						</c:if>
					
					
			
						<div id="inputLeft">
							<br>
						 <br>	
				 <button name="btnUpdate" class="btn btn-primary">Cập nhật</button>
				 <br>
						 <br>
						</div>
			 </form>
			
	 
			 <p>${message }</p>
				 
			
        </div>
    
           
    
    
         
	 
	 </body>
	 
	 </html>
	 