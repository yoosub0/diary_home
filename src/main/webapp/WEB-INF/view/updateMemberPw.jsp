<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@600&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&amp;display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
        formsize {
            max-width: 600px;
			margin-top: 100px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }
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

<body class="bg-light"> <!-- 배경 색상 추가 -->
<div class="container krFont">
  <div class="p-4 bg-warning text-white rounded enFont text-center">
    <h1>Diary Project</h1> 
    <p>Developing Tools: Eclipse(2022-12), JDK(17.0.6), Mariadb(10.5.19), Apache Tomcat(10), HeidiSQL
	<br>Language: java, sql, html, css, bootstrap5</p> 
  </div>
  <br><br>
        <h1 class="text-center mb-4">비밀번호 변경</h1>
        <form id="updateMemberPw" method="post" action="${pageContext.request.contextPath}/updateMemberPw">
        
        <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
		<table class="table table-bordered center">
                <tr>
                    <th>현재 비밀번호</th>
                    <td><input type="password" class="form-control" id="oldPw" name="oldPw" required></td>
                </tr>
                <tr>
                    <th>새로운 비밀번호</th>
                    <td><input type="password" class="form-control" id="newPw" name="newPw" required></td>
                </tr>
            </table>
            <button class="btn btn-primary" id="updateBtn" type="submit">수정</button>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">홈으로</a>
        </form>
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
