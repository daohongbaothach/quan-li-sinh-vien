<%@ page language="java" contentType="text/html; charset=Utf-8"
    pageEncoding="Utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@taglib prefix="tg" tagdir="/WEB-INF/tags/" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
	    
	<!DOCTYPE html>
	<html lang="en">
	
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Tổng kết</title>
		<base href="${pageContext.servletContext.contextPath}/">
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="resources/css/index.css">
        <style>	
	
	#tabletk {
    width: 100%;
    border-collapse: collapse;
    margin-top: 5%;

}

#tabletk th {
    font-size: 14px;
    background-color: #343A40;
    padding: 8px 32px 8px 8px;
    border-bottom: 1px solid gray;
    text-align: center;
    color: #FFFFFF;
    background-color: #343A40;


}

#tabletk td {
    font-size: 14px;
    text-align: center;
    padding: 8px 32px 8px 0px;
    border-bottom: 1px solid gray;

}

.horizontal {
    margin: 8px 60px;
}

input {
    outline: none;
    margin-left: 40px;
    background-color: #E4E4E4;
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
    .vertical{
        margin: 10px;
    }
    .check2{
        color: cornsilk;
    }
		</style>
        
	</head>
	
	<body>
        <div id="main">
        
                <div class="vertical">
        
                    <p> <img style="border-radius: 32px;" width="24px" height="24px" src="resources/images/ptit_logo.png" alt=""> Xin chào ${quyen1.TK}${quyen2.TK}</p>
                    <hr>
        
        
                    <div class="btn"><a href="loginn.htm"><i class="fa fa-backward"></i> Trở về trang chủ</a></div>
                    <div class="btn"><a href="dangxuat.htm"><i class="fa fa-outdent"></i> Đăng xuất</a></div>
                </div>
                <jsp:useBean id ="pagedListHolder" scope = "request"
                	type="org.springframework.beans.support.PagedListHolder"/>
                	<c:url value="/tongket.htm" var="pagedLink">
                		<c:param name="p" value="~"/>
                	</c:url>
                 <div>
                	<tg:paging pagedListHolder="${pagedListHolder }"
                		pagedLink="${pagedLink}" />
                </div>
                <div class="horizontal">
                    <table id="tabletk">
                        <form:form action="tongket.htm" method="post">
                
                
                
                 <th>Mã lớp tín chỉ</th>
                        <th>Học kì</th>
                        <th>Năm</th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th>
                        <th>F</th>
                        <th>Số sinh viên đạt</th>
                        </tr>
                    <c:if test="${quyen1.maQuyen =='1'}">
                    <c:set var="i" value="${0}"/>
<%--                     <c:forEach var="nam" items="${ltcnam }">			 --%>
					<c:forEach var="nam" items="${pagedListHolder.pageList }">
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
<!--                          <tr> -->
<!--                         <th>Mã lớp tín chỉ</th> -->
<!--                         <th>Học kì</th> -->
<!--                         <th>Năm</th> -->
<!--                         <th>A</th> -->
<!--                         <th>B</th> -->
<!--                         <th>C</th> -->
<!--                         <th>D</th> -->
<!--                         <th>F</th> -->
<!--                         <th>Số sinh viên đạt</th> -->
<!--                         </tr> -->
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
                        <td id="edit"><a href="nhapdiem/nhap/${nam.maLTC }.htm?linkEdit" id="aedit"><i class="fa-solid fa-pen-to-square"></i>Chi tiết/Chỉnh sửa</a></td>
                        </tr>
                    </c:forEach>
                </c:if>
                     
                </form:form>
                    </table>
                    <table id="tabletk">
                        <form:form action="tongket.htm" method="post">
                
                
                
                    <c:set var="i" value="${0}"/>
                    <c:forEach var="nam" items="${ltcnam }">
                    <c:if test="${quyen2.maQuyen ==2 }">
                    <c:forEach var="l" items="${ltcgv }">
                        <c:if test="${l.maLTC == nam.maLTC }">
                        
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
                        <th>Mã lớp tín chỉ</th>
                        <th>Học kì</th>
                        <th>Năm</th>
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
                        <td id="edit"><a href="nhapdiem/nhap/${nam.maLTC }.htm?linkEdit" id="aedit"><i class="fa-solid fa-pen-to-square"></i>Chi tiết/ Chỉnh sửa</a></td>
                        </tr>
                        </c:if>
                    </c:forEach>
                    </c:if>
                    </c:forEach>
                    
                    
                     
                </form:form>
                    </table>
       
                </div>
            
            </div>
        
	
	</body>
	
	</html>
	