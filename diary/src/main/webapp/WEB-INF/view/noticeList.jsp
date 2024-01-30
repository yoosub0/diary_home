<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 목록</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<div class="container" align="center">
		<div align="right"><br>
			<button disabled class="btn btn-outline-dark">누적 접속자 : ${totalCnt }</button>
			<button disabled class="btn btn-outline-primary">접속자 : ${currentCnt }</button>
		</div><br>
		<div style="background-color:#D1E7DD; border-radius:5px;">
			<br><br><h1>${loginMember.memberId }'s Diary</h1><br><br>
		</div>
	</div><br>
	<!-- 헤더 -->
	<div class="container">
		<div style="border:5px solid #D1E7DD; border-radius:5px;">
			<div class="container" align="center">
				<br><h1>공지 목록</h1><br>
				<c:if test="${loginMember.getMemberLevel() > 0 }">
					<a href="${pageContext.request.contextPath }/addNotice" class="btn btn-outline-dark">공지 추가</a>
				</c:if>
				<a href="${pageContext.request.contextPath }/home" class="btn btn-outline-dark">홈으로</a><br><br>
				<table class="table col-lg-12">
					<tr align="center">
						<th class="col-lg-1">공지 번호</th>
						<th class="col-lg-8">공지 제목</th>
						<th class="col-lg-1">작성자</th>
						<th class="col-lg-2"></th>
					</tr>
					<c:forEach var="n" items="${list}">
						<tr align="center">
							<td>${n.noticeNo }</td>
							<td>
								<a href="${pageContext.request.contextPath }/noticeOne?noticeNo=${n.noticeNo }" style="color:black">
									${n.noticeTitle }
								</a>
							</td>
							<td>${n.memberId }</td>
							<td>
								<c:if test="${loginMember.memberLevel > 0 }">
									<a href="${pageContext.request.contextPath }/removeNotice?noticeNo=${n.noticeNo }" class="btn btn-outline-danger" style="float:right">삭제</a>
									<a href="${pageContext.request.contextPath }/modifyNotice?noticeNo=${n.noticeNo }" class="btn btn-outline-dark" style="float:right">수정</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table><br>
				<div>
					<c:if test="${currentPage - 1 > 0 }">
						<a href="${pageContext.request.contextPath }/noticeList?currentPage=${currentPage - 1}" class="btn btn-outline-dark">이전</a>
					</c:if>
					<c:if test="${!(currentPage - 1 > 0) }">
						<button class="btn btn-outline-dark" disabled>이전</button>
					</c:if>
					<button class="btn btn-outline-dark" disabled>${currentPage }</button>
					<c:if test="${currentPage < lastPage}">
						<a href="${pageContext.request.contextPath }/noticeList?currentPage=${currentPage + 1}" class="btn btn-outline-dark">다음</a>
					</c:if>
					<c:if test="${!(currentPage < lastPage)}">
						<button class="btn btn-outline-dark" disabled>다음</button>
					</c:if>
				</div><br>
			</div>
		</div>
	</div>
</body>
</html>