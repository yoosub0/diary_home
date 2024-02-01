<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>공지사항</title>
    
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
	<br>
    
    <div class="container mt-3 center krFont">
    <div>
	    <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary ">홈으로</a>
	    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger">로그아웃</a>
	</div>
	<br>
	<table class="table text-center">
		<tr>
			<td><h2 class="krFont">공지사항 목록</h2></td>
			<c:if test="${loginMember.memberLevel==1}">
			<td><a href="${pageContext.request.contextPath}/addNotice" class="btn btn-outline-primary krFont">공지 추가</a></td>
			</c:if>
		</tr>
	</table>
				
<div class="row">
    <div class="col-xs-12 col-md-8"></div> <!-- 왼쪽 영역 -->
    
    <div class="col-xs-12 col-md-4">
        <div class="input-group input-group-sm hidden-xs" style="width: 300px;">
            <form class="search-form" id="searchNotice" name="searchNotice" method="post" action="${pageContext.request.contextPath}/noticeList">
                <div class="input-group input-group-sm hidden-xs">
                    <input type="text" name="noticeTitle" class="form-control pull-right" placeholder="제목을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='제목을 입력하세요'">
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-outline-primary">검색</button>
                    </span>	
                </div>
            </form>
        </div>
    </div> <!-- 오른쪽 영역 -->
</div>

		        	
	
    <table class="table text-center">
        <thead class="table-primary h5 krFont">
            <tr>
                <th>공지번호</th>
                <th>공지사항 제목</th>
                <th>작성일자</th>
            </tr>
        </thead>
        <tbody class="krFont">
            <c:forEach var="n" items="${list}">
                <tr>
                    <td>${n.noticeNo}</td>
                    <td>
                        <a class="text-success" href="${pageContext.request.contextPath}/noticeOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
                    </td>
                    <td>${n.createdate}
                </tr>
            </c:forEach>
        </tbody>
    </table>


 
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage-1}" class="btn btn-outline-secondary">이전</a>
        </c:if>
               <span class="krFont">${currentPage}</span>
        <c:if test="${currentPage < lastPage}">
            <a href="${pageContext.request.contextPath}/noticeList?currentPage=${currentPage+1}" class="btn btn-outline-secondary">다음</a>
        </c:if>
       </div>
       </div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
