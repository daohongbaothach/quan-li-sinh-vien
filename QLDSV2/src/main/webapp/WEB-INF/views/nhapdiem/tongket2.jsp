<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
	<!DOCTYPE html>
	<html lang="en">
	
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Nhap Diem</title>
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<style>
			body {
		color: gray;
	}
	
	
	
	table {
		width: 1000px;
		border-collapse: collapse;
		margin: auto;
	
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
		padding: 8px 16px 8px 16px;
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
		padding: 4px 4px;
		background-color: #28A745;
		border: 1px solid #28A745;
		cursor: pointer;
		color: #FFFFFF;
		transition: 0.5s;
		margin-top: 4px;
		margin-bottom: 4px;
	}
	#aedit{
		color: white;
	}
	
	#edit:hover {
		background-color: #80f39b;
		color: #beb8b8;
	}
		</style>
	</head>
	
	<body>
		<h10 id="name">Xin chao <a href="ttdn.htm"></i>${quyen1.TK}${quyen2.TK}</a><td>-</td><a href="dangxuat.htm"></i>Dang xuat</a></h10>
		<div id="output">
			<table id="table">
				<form:form action="tongket.htm" method="post">
		
		
		
			<c:set var="i" value="${0}"/>
			<c:forEach var="nam" items="${ltcnam }">
			
				
				<c:set var="demA" value="${0 }"/>
				<c:set var="demB" value="${0 }"/>
				<c:set var="demC" value="${0 }"/>
				<c:set var="demD" value="${0 }"/>
				<c:set var="demF" value="${0 }"/>
				<c:set var="dem" value="${0 }"/>
				<c:forEach var="diem" items="${nam.dangKiLTCE }">
					
					<c:set var="tong" value="${0}"/>
					
					<c:set var="tong" value="${(diem.DCC*0.1 + diem.DGK*diem.lopTinChiE.heSo1*0.1 + diem.DThi*diem.lopTinChiE.heSo2*0.1)}" />
					<c:if test ="${tong >='8.5' }"><c:set var="demA" value="${demA +1 }"/></c:if>
					<c:if test ="${tong >='7' && tong <'8.5' }"><c:set var="demB" value="${demB +1 }"/></c:if>
					<c:if test ="${tong >='6' && tong <'7' }"><c:set var="demC" value="${demC +1 }"/></c:if>
					<c:if test ="${tong >='4' && tong <'6' }"><c:set var="demD" value="${demD +1 }"/></c:if>
					<c:if test ="${tong <'4' }"><c:set var="demF" value="${demF +1 }"/></c:if>
					<c:set var="dem" value="${dem =dem +1 }"/>
					<div> </div>
				</c:forEach>
				 <tr>
				<th>Ma Lop Tin Chi</th>
				<th>Hoc Ki</th>
				<th>Nam</th>
				<th>A</th>
				<th>B</th>
				<th>C</th>
				<th>D</th>
				<th>F</th>
				<th>Số sinh viên đạt</th>
				</tr>
				<div></div>
				<tr>
				<td>${nam.maLTC }</td>
				<td>${nam.hocKi }</td>
				<td>${nam.nam }</td>
				<td> ${demA }  </td>
				<td> ${demB }  </td>
				<td> ${demC }  </td>
				<td> ${demD }  </td>
				<td> ${demF }  </td>
				<td> ${dem - demF }/${dem }  </td>
				<td id="edit"><a href="nhapdiem/nhap/${nam.maLTC }.htm?linkEdit" id="aedit"><i class="fa-solid fa-pen-to-square"></i>Chi tiáº¿t/Chá»nh sá»­a</a></td>
				</tr>
			</c:forEach>
		
			 
		</form:form>
			</table>
		</div>
	
	</body>
	
	</html>
	