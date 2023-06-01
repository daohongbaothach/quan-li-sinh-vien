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
		 <title>Nhập lớp tín chỉ</title>
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
		 width: 60%;
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
     .vertical{
         margin: 10px;
     }
     .horizontal{
         margin: 20px;
         display:flex;
         flex-direction: column;
     }
     .input-group-text{
         background-color: gray;
         color: white;
         width: 20%;
     }
	 #iTable {
    width: 100%;
    border-collapse: collapse;
		margin:auto;


}

#iTable th {
    font-size: 16px;
    background-color: #343A40;
    padding: 8px 16px 8px 8px;
	text-align: center;
    border-bottom: 1px solid gray;
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
#open{
	width: 30px;
}
#close{
	width: 30px;
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
         <h1 id="name">Thông tin các lớp tín chỉ</h1>
         
            <div id="inputLeft">
                <form:form action="nhapdiem/LTC.htm" modelAttribute="maltc" method ="get">
                     <div>
                            <label for="basic-url" class="form-label">Nhập thông tin để tìm kiếm</label>
                            <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon3">Mã lớp tín chỉ</span>
                            <select name = "timLTC" class="form-control form-select" id="basic-url" aria-describedby="basic-addon3">
                                <option selected>     </option> <!-- de trong neu ko muon tim theo ma ltc hoac tim tat ca -->
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
                                <option selected>     </option> <!-- de trong neu ko muon tim theo hk -->
                                <option value="1">     1</option>
                                <option value="2">     2</option>
                              </select>
                            <br>
                            </div>
                            <button name="btnSearchLTC" class="btn btn-primary">Tìm kiếm</button>
                            <br>
                            <br>
                </form:form>
			</div>
    
                <form method="post" action="nhapdiem/LTC.htm">
    
                    <c:if test="${quyen1.maQuyen =='1' }">
                    <table id="iTable">
							<tr>
								<th>STT</th>
								<th>Lớp tín chỉ</th>
								<th>Sinh viên tối thiểu</th>
								<th>Sinh viên tối đa</th>
								<th>Mã môn học</th>
								<th>Học kì</th>
								<th>Năm</th>
								<th>Hệ số 1</th>
								<th>Hệ số 2</th>
								<th>Trạng thái</th>
							</tr>
							
					<c:set var="i" value="${0}"/>
                    <c:forEach  var="user" items="${users}">
					
							
							<tr>
								<td>
									<c:set var="i" value="${i + 1}" />
									${i}
								</td>
								<td>${user.maLTC }
									<input type="hidden" name="maltc"  value="${user.maLTC }" >
								</td>
								<td>
									<input type="text" name="svtt" value="${user.SVTT }">
								</td>
								<td>
									<input type="text" name="svtd" value="${user.SVTD }" >
								</td>
								<td>${user.maMH }
									<input type="hidden" name="mamh" value="${user.maMH }" >
								</td>
								<td>
									<input type="text" name="hocki" value="${user.hocKi }">
								</td>
								<td>
									<input type="text" name="nam" value="${user.nam }">
								</td>
								<td>
									<input type="text" name="heso1" value="${user.heSo1 }">
								</td>
								<td>
									<input type="text" name="heso2" value="${user.heSo2}">
									
	
									
								</td>
								<td>
								<select name = "trangthai" class="form-select" aria-label="Default select example" style="background-color:#E4E4E4; border: none">
                                <option selected <c:if test ="${user.trangThai == 'True'}"> value ="True"
                                	</c:if>
                                	<c:if test ="${user.trangThai == 'False'}"> value ="False"
                                	</c:if>
                                 
                                 >  
                                 <c:if test ="${user.trangThai == 'True'}">Mở</c:if> 
                                 <c:if test ="${user.trangThai == 'False'}">Khóa</c:if>
                                 </option> 
                                 
								<option  <c:if test ="${user.trangThai == 'True'}"> value ="False"
                                	</c:if>
                                	<c:if test ="${user.trangThai == 'False'}"> value ="True"
                                	</c:if>
                                 
                                 >  
                                 <c:if test ="${user.trangThai == 'True'}">Khóa</c:if> 
                                 <c:if test ="${user.trangThai == 'False'}">Mở</c:if>
                                 </option> 
                              </select>
								
								
                                </td>
                                
                            
								
							</tr>
						   </c:forEach>
						</table>
							
                     
                     </c:if>
					 <br>
					 <div id="inputLeft">
                        <button name="btnUpdate" class="btn btn-primary">Cập nhật</button>
                        <br>
					</div>

                </form>
                <p>${message }</p>
            <p>${message1 }</p>
            <p>${message2 }</p>
            <p>${message3 }</p>
    
				</div>
    
	<script>
		openn = document.querySelector("#open")
	closee = document.querySelector("#close")
	function openChecked() {

    document.querySelector('input[id="open"]:checked').value = 1;
    closee.value = 0;
    console.log("open value = ", document.querySelector('input[id="open"]:checked').value)
    console.log("close value = ", closee.value)


	}
	function closeChecked() {
    document.querySelector('input[id="close"]:checked').value = 1;
    openn.value = 0;
    console.log("close value = ", document.querySelector('input[id="close"]:checked').value)
    console.log("open value = ", openn.value)
	}
	</script>
         
	 
	 </body>
	 
	 </html>
	 