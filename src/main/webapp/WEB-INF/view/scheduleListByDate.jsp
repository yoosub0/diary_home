<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<form action="./scheduleListByDate" method="get">
			<select name="year">
				<option value="">년</option>
				<c:forEach var="year" begin="${maxMinMap.minYear}" end="${maxMinMap.maxYear}" step="1">
				<option value="${year}">${year}</option>					
				</c:forEach>
			</select>
			
			<select name="month">
				<option value="">월</option>
				<c:forEach var="month" begin="1" end="12" step="1">
				<option value="${month}">${month}</option>						
				</c:forEach>
			</select>
			
			<select name="day">
				<option value="">일</option>
				<c:forEach var="day" begin="1" end="31" step="1">
				<option value="${day}">${day}</option>				
				</c:forEach>
			</select>
		
		<button type="submit">검색</button>
		</form>
	</div>


	<table border="1">
		<tr>
			<th>no</th>
			<th>date</th>
			<th>memo</th>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.scheduleNo}</td>
				<td>${s.scheduleDate}</td>
				<td>${s.scheduleMemo}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>