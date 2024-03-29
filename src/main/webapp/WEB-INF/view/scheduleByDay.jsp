<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@600&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&amp;display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <title>일정 상세 정보</title>
<style>
	a {text-decoration: none;}
	a:hover {text-decoration: underline;}
	.center {text-align: center;}
	.enFont {
		font-family: 'Comfortaa', cursive;
	}
	.krFont {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body class="bg-light">
	<div class="container">
	  <div class="p-4 bg-warning text-white rounded enFont text-center">
	    <h1>Diary Project</h1> 
	    <p>Developing Tools: Eclipse(2022-12), JDK(17.0.6), Mariadb(10.5.19), Apache Tomcat(10), HeidiSQL
		<br>Language: java, sql, html, css, bootstrap5</p> 
	  </div>
    	<div class="container mt-4 krFont text-center">
        <h1>${Year}년 ${Month}월 ${Day}일 일정리스트</h1>
        <h3>${loginMember.memberId}님 일정 상세정보</h3>
		</div>
        <table class="table table-bordered text-center krFont">
            <thead>
                <tr>
                    <th style="width: 160px;">일정</th>
                    <th>메모</th>
                    <th style="width: 80px;">수정</th>
                    <th style="width: 80px;">삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="r" items="${resultList}">
                    <tr>
                        <td>${r.scheduleDate}</td>
                        <td>${r.scheduleMemo}</td>
                        <td>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/updateSchedule?scheduleNo=${r.scheduleNo}">수정</a>
                        </td>
                        <td>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteSchedule?scheduleNo=${r.scheduleNo}">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
		<div class="krFont">
        <h1>일정 추가</h1>
        <form id="insertSchedule" method="post" action="${pageContext.request.contextPath}/insertSchedule">
            <input type="hidden" name="targetY" value="${Year}">
            <input type="hidden" name="targetM" value="${Month}">
            <input type="hidden" name="targetD" value="${Day}">
            <input type="hidden" name="memberId" value="${loginMember.memberId}">
            <div class="mb-3">
                <textarea class="form-control" rows="3" name="scheduleMemo" id="scheduleMemo"></textarea>
            </div>
            <button class="btn btn-success" id="addBtn" type="submit">일정 추가</button>
          	<a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">이전</a>
        </form>
 
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
