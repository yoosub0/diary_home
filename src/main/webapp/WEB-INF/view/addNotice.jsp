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
        <h1 class="text-center mb-4">공지사항 작성</h1>
        <form id="addNotice" method="post" action="${pageContext.request.contextPath}/addNotice">
            <table class="table table-bordered text-center">
                <tr>
                    <th>제목</th>
                    <td><input type="text" class="form-control" id="noticeTitle" name="noticeTitle" required></td>
                </tr>
                <tr>
                    <th>공지사항 내용</th>
                    <td><textarea class="form-control" id="noticeContent" name="noticeContent" rows="10" cols="100" required></textarea></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" class="form-control" id="noticePw" name="noticePw" required></td>
                </tr>
            </table>
            <button class="btn btn-primary" id="addBtn" type="submit">공지사항 추가</button>
        </form>
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
