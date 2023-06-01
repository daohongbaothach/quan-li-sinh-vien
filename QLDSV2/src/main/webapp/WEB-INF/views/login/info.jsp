<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${message2}
<h1>Thong Tin Sinh Vien</h1>

<ul>
	<li>Ma so sv: ${info.maSV}</li>
	<li>Ho sv: ${info.hoSV}</li>
	<li>Ten sv: ${info.tenSV}</li>
	<li>Ten sv: ${info.tenSV}</li>
	<li>Lop: ${info.maLop}</li>
	<li>Khoa: ${info.maLop}</li>
</ul>
<c:forEach var="diem" items="${info_d }">
	<li>Ma Lop TC: ${diem.maLTC}</li>
	<li>Mon hoc: ${diem.lopTinChiE.monHocE.tenMH}</li>
	<li>Diem chuyen can: ${diem.DCC}</li>
	<li>Diem giua ki: ${diem.DCC}</li>
	<li>Diem thi: ${diem.DCC}</li>
	<div>-</div>
</c:forEach>
</body>
</html>