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
            <a class="btn btn-outline-primary mr-2" href="${pageContext.request.contextPath}/updateNotice?noticeNo=${notice.noticeNo}">수정</a>
            <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${notice.noticeNo}">삭제</a>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/noticeList">이전</a>
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
		
		
			<div class="container" align="center">
		<div style="border:3px solid #000000; border-radius:5px;"><br><br>
		
			<table class="table">
				<c:forEach var="c" items="${list }">
					<tr align="center" style="height:70px">
						<c:choose>
							<c:when test="${c.isSecret == true && (loginMember.memberLevel > 0 || loginMember.memberId == c.memberId)}">
								<td><span class="badge rounded-pill bg-warning">Secret</span></td>
								<td class="col-lg-8">${c.commentContent }</td>
								<td class="col-lg-1">${c.memberId }</td>
								<td class="col-lg-1">${c.createdate }</td>
								<td class="col-lg-2">
								<c:if test="${loginMember.memberId == c.memberId }">
									<a href="${pageContext.request.contextPath }/updateComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-dark">수정</a>
								</c:if>
								<c:if test="${loginMember.memberId == c.memberId || loginMember.memberLevel > 0}">
									<a href="${pageContext.request.contextPath }/deleteComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-danger">삭제</a>
								</c:if>
								</td>
							</c:when>
							
							<c:when test="${c.isSecret == true && loginMember.memberId != c.memberId}">
								<td><span class="badge rounded-pill bg-warning">Secret</span></td>
								<td>비밀글 입니다.</td>
								<td colspan="3">비밀글 입니다.</td>
							</c:when>
							<c:otherwise>
								<td><span class="badge rounded-pill bg-success">Public</span></td>
								<td class="col-lg-8">${c.commentContent }</td>
								<td class="col-lg-1">${c.memberId }</td>
								<td class="col-lg-1">${c.createdate }</td>
								<td class="col-lg-2">
								<c:if test="${loginMember.memberId == c.memberId }">
									<a href="${pageContext.request.contextPath }/updateComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-dark">수정</a>
								</c:if>
								<c:if test="${loginMember.memberId == c.memberId || loginMember.memberLevel > 0}">
									<a href="${pageContext.request.contextPath }/deleteComment?commentNo=${c.commentNo}&noticeNo=${resultNotice.noticeNo }" class="btn btn-outline-danger">삭제</a>
								</c:if>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>
		<br>
			<div>
				<table class="table">
					<tr align="center">
						<form action="${pageContext.request.contextPath }/insertComment" method="post" id="form">
							<td class="col-lg-8">
								<textarea name="commentContent" rows="2" cols="100" id="commentContent"></textarea>
							</td>
							<td class="col-lg-2">
								<input type="checkbox" name="isSecret" value="true">비밀글
							</td>
							<td>
								<input type="hidden" name="memberId" value="${loginMember.memberId }">
								<input type="hidden" name="noticeNo" value="${resultNotice.noticeNo }">
							</td>
						</form>
						<td class="col-lg-2">
							<button type="submit" class="btn btn-outline-dark" id="btn">추가</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
</div>
<!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function(){
        $('#btn').click(function(){
            if($('#commentContent').val().length < 1){
                alert('코멘트 내용을 입력하세요')
            } else {
                $('#form').submit()
            }
        })
    });
</script>

</body>
</html>
