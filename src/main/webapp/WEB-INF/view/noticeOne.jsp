<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<div class="container">
  <div class="p-4 bg-warning text-white rounded enFont text-center">
    <h1>Diary Project</h1> 
    <p>Developing Tools: Eclipse(2022-12), JDK(17.0.6), Mariadb(10.5.19), Apache Tomcat(10), HeidiSQL
	<br>Language: java, sql, html, css, bootstrap5</p> 
  </div>
    <div class="container krFont ">
        <h1 class="my-4 center">공지사항 상세정보</h1>
        <div class="mb-3">
            <a class="btn btn-primary mr-2" href="${pageContext.request.contextPath}/updateNotice?noticeNo=${notice.noticeNo}">수정</a>
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${notice.noticeNo}">삭제</a>
        </div>
        <table class="table table-bordered text-center krFont">
            <thead>
                <tr>
                    <th>번호</th>
                    <td>${resultNotice.noticeNo}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>${resultNotice.noticeTitle}</td>
                </tr>
                <tr>
                    <th>공지내용</th>
                	<td>${resultNotice.noticeContent}</td>
                </tr>
                <tr>
                    <th>작성일자</th>
                	<td>${resultNotice.createdate}</td>
                </tr>
            </thead>
  
        </table>
        <input type="text" name="comment" id="comment" value="${comment}">
        
		<br><br>
        <a class="btn btn-success" href="${pageContext.request.contextPath}/addComment?noticeNo=${notice.noticeNo}">댓글 추가하기</a>
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
