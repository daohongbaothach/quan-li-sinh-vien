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
${message}
${message2}
<table class="table table-hover">
<form:form action="danhsach.htm" modelAttribute="maltc" method ="get">
   <div>
      <label>Ma Lop</label>
      <input name = "searchInput"  >
      <button class="btn btn-default" name="btnSearch">Tim kiem</button>
   </div>
  <div>

   </div>
</form:form>
<c:forEach  var="u" items="${ltc}">
  <tr>
     <td><div contenteditable>${u.maLTC}</div></td>
		<label>Fullname</label>
      
            <td><a href="nhap.htm">${u.maLTC}</a></td>
      
  </tr>

</c:forEach>

</table>
</body>
</html>