<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>trangchu</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/index.css">
</head>
 <body>

		<form:form action="login/thongtindangnhap.htm" method="post">
		
		
			
			<c:if test = "${quyen.maQuyen == '3'}"> 
				<div id="main">
					<div class="vertical">
			
						<p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> 
							${info.hoSV} ${info.tenSV}
						</p>
						<hr>
						<div class="ttmh">
							<div class="btn check2" style="color: white;">Xem điểm <i class="fa fa-angle-right"></i></div>
							<div class="in2">
								<div> <label for="MMH">Năm</label></div>
								<div> <input type="text" id="MMH"> <i class="fa fa-search btnn"></i></div>
							</div>
						</div>
						<div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
					</div>
					<div class="horizontal">
			
						
							<table id="table">
								<tr>
									<th>Mã sinh viên</th>
									<td>${info.maSV}</td>
								</tr>
								<tr>
									<th>Tên sinh viên</th>
									<td>${info.hoSV} ${info.tenSV}</td>
								</tr>
								<tr>
									<th>Phái</th>
									<c:if test="${info.phai == 'true' }">
									<td>Nam</td>
									</c:if>
									<c:if test="${info.phai == 'false' }">
									<td>Nữ</td>
									</c:if>
								</tr>
								<tr>
									<th>Ngày sinh</th>
									<td>${info.ngaySinh}</td>
								</tr>
								<tr>
									<th>Địa chỉ</th>
									<td>${info.diaChi}</td>
								</tr>
								<tr>
									<th>Lớp</th>
									<td>${info.maLop}</td>
								</tr>
								<tr>
									<th>Nghành</th>
									<td>Công nghệ thông tin</td>
								</tr>
								<tr>
									<th>Khoa</th>
									<td>Công Nghệ Thông Tin 2</td>
								</tr>
								<tr>
									<th>Hệ đào tạo</th>
									<td>Đại học chính quy</td>
								</tr>
								<tr>
									<th>Năm	 học</th>
									<td>${info.lopE.khoaHoc}</td>
								</tr>
			
			
							</table>
							<br>
							<div class="choice">
								<label for="point">Nhập năm học xem điểm :</label>
								<input type="text" id="point">
								<i class="fa fa-search btnn"></i>
							</div>
			
			
								<c:set var="i" value="${0}"/>
								
								<c:set var="tong" value="${0}"/>
								<c:set var="tongsotc" value="${0}"/>
								<c:forEach var="nam" items="${namhoc}">
									<c:set var="i1" value="${0}"/>
									<c:set var="tong1" value="${0}"/>
									<c:set var="tongsotc1" value="${0}"/>
									<table id="pointTable">
									<c:forEach var="diem" items="${info_d }">
										<c:if test = "${diem.lopTinChiE.nam == nam }">
										<c:set var="STT" value="${0}"/>
										<c:if test = "${diem.lopTinChiE.hocKi == '1' }">
											<tr id="tr1">
												<th>STT</th>
												<th>Mã môn</th>
												<th>Tên môn</th>
												<th>TC</th>
												<th>%CC</th>
												<th>%GK</th>
												<th>%Thi</th>
												<th>Điểm CC</th>
												<th>Điểm GK</th>
												<th>Thi L1</th>
												<th>Thi L2</th>
												<th>Thi L3</th>
												<th>TK (10)</th>
												<th>TK(CH)</th>
												<th>KQ1</th>
												<th>KQ</th>
						
											</tr>
											
											<tr id="hk">
												<th>
						
												</th>
												<th></th>
												<th>Học kỳ 1 - Năm học ${diem.lopTinChiE.nam}</th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
											</tr>
											<tr>
												<c:set var="STT" value="${STT + 1}"/>
												<td>${STT}</td>
												<td>${diem.maLTC}</td>
												<td>${diem.lopTinChiE.monHocE.tenMH}</td>
												<td>${diem.lopTinChiE.monHocE.soTC}</td>
												<td>1.0</td>
												<td>${diem.lopTinChiE.heSo1}</td>
												<td>${diem.lopTinChiE.heSo2}</td>
												<td>${diem.DCC}</td>
												<td>${diem.DGK}</td>
												<td>${diem.DThi}</td>
												<td></td>
												<td></td>
												<td>${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1}</td>
												<td></td>
												<td><c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 >= 4  }">Đạt</c:if>
												<c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 < 4  }">Không Đạt</c:if>
												</td>
												<td><c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 > 4  }">Đạt</c:if>
												<c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 < 4  }">Không Đạt</c:if>
												</td>
											</tr>
											<c:set var="tong" value="${tong + diem.lopTinChiE.monHocE.soTC*(diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1)}" />
											<c:set var="i" value="${i + 1}" />
											<c:set var="tongsotc" value="${tongsotc + diem.lopTinChiE.monHocE.soTC}"/>
											<c:set var="tong1" value="${tong1 + diem.lopTinChiE.monHocE.soTC*(diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1)}" />
											<c:set var="i1" value="${i1 + 1}" />
											<c:set var="tongsotc1" value="${tongsotc1 + diem.lopTinChiE.monHocE.soTC}"/>
										
										</c:if>
										</c:if>
									</c:forEach>
								</table>
									<c:if test="${tong1 != '0' }">
										<table id="lTable">
											<tr>
												<th>Điểm trung bình học kỳ 1 nam ${nam } hệ 10/100:</th>
												<td>${tong1/tongsotc1}</td>
											</tr>

											<tr>
												<th>Số tín chỉ đạt:</th>
												<td>${tongsotc1}</td>
											</tr>			
										</table>
									</c:if>
								
									<c:set var="i2" value="${0}"/>
									<c:set var="tong2" value="${0}"/>
									<c:set var="tongsotc2" value="${0}"/>
									<table id="pointTable">
									<c:forEach var="diem" items="${info_d }">
										<c:if test = "${diem.lopTinChiE.nam == nam }">
										<c:set var="STT" value="${0}"/>
										<c:if test = "${diem.lopTinChiE.hocKi == '2' }">
											
											<tr id="tr1">
												<th>STT</th>
												<th>Mã môn</th>
												<th>Tên môn</th>
												<th>TC</th>
												<th>%CC</th>
												<th>%GK</th>
												<th>%Thi</th>
												<th>Điểm CC</th>
												<th>Điểm GK</th>
												<th>Thi L1</th>
												<th>Thi L2</th>
												<th>Thi L3</th>
												<th>TK (10)</th>
												<th>TK(CH)</th>
												<th>KQ1</th>
												<th>KQ</th>
						
											</tr>
											
											<tr id="hk">
												<th>
						
												</th>
												<th></th>
												<th>Học kỳ 2 - Năm học ${diem.lopTinChiE.nam}</th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
											</tr>
											<tr>
											<c:set var="STT" value="${STT + 1}"/>
												<td>${STT}</td>
												<td>${diem.maLTC}</td>
												<td>${diem.lopTinChiE.monHocE.tenMH}</td>
												<td>${diem.lopTinChiE.monHocE.soTC}</td>
												<td>1.0</td>
												<td>${diem.lopTinChiE.heSo1}</td>
												<td>${diem.lopTinChiE.heSo2}</td>
												<td>${diem.DCC}</td>
												<td>${diem.DGK}</td>
												<td>${diem.DThi}</td>
												<td></td>
												<td></td>
												<td>${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1}</td>
												<td></td>
												<td><c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 >= 4  }">Đạt</c:if>
												<c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 < 4  }">Không Đạt</c:if>
												</td>
												<td><c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 > 4  }">Đạt</c:if>
												<c:if test="${diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1 < 4  }">Không Đạt</c:if>
												</td>
											</tr>
											<c:set var="tong" value="${tong + diem.lopTinChiE.monHocE.soTC*(diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1)}" />
											<c:set var="i" value="${i + 1}" />
											<c:set var="tongsotc" value="${tongsotc + diem.lopTinChiE.monHocE.soTC}"/>
											
											<c:set var="tong2" value="${tong2 + diem.lopTinChiE.monHocE.soTC*(diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1)}" />
											<c:set var="i2" value="${i2 + 1}" />
											<c:set var="tongsotc2" value="${tongsotc2 + diem.lopTinChiE.monHocE.soTC}"/>
											<br>
											<br>
										</c:if>
										</c:if>
									</c:forEach>
								</table>
									<c:if test="${tong2 != '0' }">
										<table id="lTable">
											<tr>
												<th>Điểm trung bình học kỳ 2 nam ${nam } hệ 10/100:</th>
												<td>${tong2/tongsotc2}</td>
											</tr>
											<tr>
												<th>Số tín chỉ đạt:</th>
												<td>${tongsotc2}</td>
											</tr>			
										</table>
									</c:if>
					
									<br>
									<br>
								</c:forEach>
							
							<table id="lTable">
								<tr>
									<th>Điểm trung bình hệ 10/100:</th>
									<td>${tong/tongsotc}</td>
								</tr>
								<tr>
									<th>Số tín chỉ đạt:</th>
									<td>${tongsotc}</td>
								</tr>
			
							</table>
						
			
			
					</div>
			
			
				</div>
			</c:if>
			<c:if test = "${quyen2.maQuyen == '2'}"> 
		 
			  
			  <div id="main">
				<div class="vertical">
		
					<p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> Quản lý
						điểm
						sinh
						viên</p>
						<hr>
		
					<div class="btn"><a href="dayltc.htm"><i class="fa fa-list-alt"></i> Danh sách lớp tín chỉ giảng dạy</a></div>
					<div class="ttc">
						<div class="btn check1" style="color: white;">Danh sách sinh viên <i class="fa fa-angle-right"></i></div>
						<div class="in1">
							<div> <i class="fa fa-check-circle"></i> <a href="">Lớp tín chỉ</a></div>
							<input type="text"> <i class="fa fa-search btnn"></i>
						</div>
					</div>
		
					<div class="ttmh">
						<div class="btn check2 " style="color: white;" >Thông tin sinh viên <i class="fa fa-angle-right"></i></div>
						<div class="in2">
							<div><i class="fa fa-check-circle"></i> <a href="">Mã số sinh viên</a></div>
							<input type="text"> <i class="fa fa-search btnn"></i>
						</div>
					</div>
					<div class="btn"><a href="nhapdiem/nhap.htm"><i class="fa fa-edit"></i> Nhập điểm lớp tín chỉ</a></div>
					<div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
				</div>
				<div class="horizontal">
					<div class="horizontal_Child1">
					
						<br>
						<hr>
					</div>
					<div class="horizontal_Child2">
						<table id="table">
							<tr>
								<th>Mã giảng viên</th>
								<td>${info.giangVienE.maGV}</td>
							</tr>
							<tr>
								<th>Tên giảng viên</th>
								<td>${info.giangVienE.hoGV} ${info.giangVienE.tenGV}</td>
							</tr>
						   
							<tr>
								<th>Học hàm</th>
								<td>${info.giangVienE.hocHam}</td>
							</tr>
							<tr>
								<th>Chuyên môn</th>
								<td>${info.giangVienE.chuyenMon}</td>
							</tr>
							<tr>
								<th>Chức vụ</th>
								<td>${info.giangVienE.chucVu}</td>
							</tr>
							<tr>
								<th>Khoa</th>
								<td>Công Nghệ Thông Tin 2</td>
							</tr>
		
		
						</table>
					</div>
		
		
				</div>
				<div class="final">
					<p>Trang chủ</p>
		
				</div>
				<div class="nameInfo">
					<p>@ Học viện Công Nghệ Bưu Chính Viễn Thông Cơ Sở Thành Phố Hồ Chí Minh</p>
				</div>
			</div>
						  
			</c:if> 
			
			<c:if test = "${quyen1.maQuyen == '1'}"> 
				<div id="main">
					<div class="vertical" style="height: 100%;">
			
						<p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> Quản lý
							điểm
							sinh
							viên</p>
							<hr>
			
						<div class="btn"><a href="nhapdiem/LTC.htm"><i class="fa fa-list-alt"></i> Danh sách lớp tín chỉ</a></div>
						<div class="ttc">
							<div class="btn check1" style="color: white;">Danh sách sinh viên <i class="fa fa-angle-right"></i></div>
							<div class="in1">
								<div> <i class="fa fa-check-circle"></i> <a href="">Lớp tín chỉ</a></div>
								<input type="text"> <i class="fa fa-search btnn"></i>
							</div>
						</div>
			
						<div class="ttmh">
							<div class="btn check2" style="color: white;">Thông tin sinh viên <i class="fa fa-angle-right"></i></div>
							<div class="in2">
								<div><i class="fa fa-check-circle"></i> <a href="">Mã số sinh viên</a></div>
								<input type="text"> <i class="fa fa-search btnn"></i>
							</div>
						</div>
						<div class="btn"><a href="nhapdiem/nhap.htm"><i class="fa fa-edit"></i> Nhập điểm lớp tín chỉ</a></div>
						<div class="btn"><a href="themsv.htm"><i class="fa fa-list-alt"></i> Thêm, xóa, sửa</a></div>
						<div class="btn"><a href="taotk.htm"><i class="fa fa-cogs"></i> Tạo tài khoản</a></div>
						<div class="btn"><a href="tongket.htm"><i class="fa fa-outdent"></i> Tổng kết</a></div>
						<div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
					</div>
					<div class="horizontal">
						<div class="horizontal_Child1">
							<p>Quản Lý Điểm Sinh Viên</p>
							<br>
							<hr>
						</div>
						<div class="horizontal_Child2">
							<div class="C1">
								<p class="horizontal_Child2_1">Nhập điểm lớp tín chỉ<i class="fa fa-edit"></i></p>
								<p class="horizontal_Child2_2_1">Xem thêm <a href="nhapdiem/nhap.htm"><i class="fa fa-arrow-circle-right "
											style="color: white;"></i></a> </p>
			
			
							</div>
							<div class="C2">
								<p class="horizontal_Child2_1">Thêm, xóa, sửa <i class="fa fa-list-alt"></i></p>
								<p class="horizontal_Child2_2_2 C22_2">Xem thêm <a href="themsv.htm"><i class="fa fa-arrow-circle-right "
											style="color: white;"></i></a> </p>
			
							</div>
						</div>
			
			
					</div>
					<div class="final">
						<p>Trang chủ</p>
			
					</div>
					<div class="nameInfo">
						<p>@ Học viện Công Nghệ Bưu Chính Viễn Thông Cơ Sở Thành Phố Hồ Chí Minh</p>
					</div>
				</div>
			</c:if> 
		
		</form:form>
		
		<script src="resources/js/index.js"></script>
			
		</body>
</html>