<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary Home</title>
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
			<br><br><h1>${loginId }'s Diary</h1><br><br>
		</div>
	</div><br>
	<!-- 헤더 -->
	
	<div class="container">
		<div class="row">
			<div align="center" class="col-lg-3">
				<div>
					<button class="btn btn-outline-dark" disabled><h1>Login ID : ${loginId }</h1></button>
				</div><br>
				<div class="list-group">
					<a href="${pageContext.request.contextPath }/modifyMemberPw" class="list-group-item list-group-item-action">비밀번호 변경</a>
					<a href="${pageContext.request.contextPath }/logout" class="list-group-item list-group-item-action">로그아웃</a>
				</div><br>
				<!-- 일정검색 -->
				<ul class="list-group">
					<li class="list-group-item list-group-item-success">
						일정 검색
					</li>
					<li class="list-group-item">
						<form action="${pageContext.request.contextPath }/scheduleListByWord" method="get">
							<input type="text" name="word">&nbsp;&nbsp;
							<button class="btn btn-outline-dark" style="float:right">검색</button>
						</form>	
					</li>
					<li class="list-group-item">
						<form action="${pageContext.request.contextPath }/scheduleListByYMD" method="get">
							<select name="year">
								<option value=""></option>
								<c:forEach var="y" begin="${maxMinMap.minYear }" end="${maxMinMap.maxYear }" step="1">
									<option value="${y}">${y}</option>
								</c:forEach>
							</select>년
							<select name="month">
								<option value=""></option>
								<c:forEach var="m" begin="1" end="12" step="1">
									<option value="${m }">${m }</option>
								</c:forEach>
							</select>월
							<select name="date">
								<option value=""></option>
								<c:forEach var="d" begin="1" end="31" step="1">
									<option value="${d }">${d }</option>
								</c:forEach>
							</select>일
							<button class="btn btn-outline-dark" style="float:right">검색</button>
						</form> 
					</li>
				</ul><br>
				<!-- 일정검색 -->
				<div class="list-group">
					<a class="list-group-item list-group-item-action list-group-item-success">공지 미리보기</a>
					<c:forEach var="n" items="${noticeList }">
						<a href="${pageContext.request.contextPath }/noticeOne?noticeNo=${n.noticeNo}" class="list-group-item list-group-item-action">
							${n.noticeTitle }
						</a>
					</c:forEach>
					<a href="${pageContext.request.contextPath }/noticeList" class="list-group-item list-group-item-action">-> 공지 목록으로...</a>
				</div>
			</div>
			<!-- 캘린더 -->
			<div align="center" class="col-lg-9">
				<div><br>
					<button class="btn btn-outline-success" disabled><h1>${calendarMap.targetYear}년 ${calendarMap.targetMonth + 1}월</h1></button>
				</div><br>
				<div>
					<a href="${pageContext.request.contextPath }/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth - 1}" class="btn btn-outline-dark" style="float:left">이전 달</a>
					<a href="${pageContext.request.contextPath }/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth + 1}" class="btn btn-outline-dark" style="float:right">다음 달</a>
					<br><br>
					<table class="table table-bordered">
						<tr align="center" class="table-success">
							<th style="color:red" class="col-lg-1">SUN</th>
							<th class="col-lg-1">MON</th>
							<th class="col-lg-1">TUE</th>
							<th class="col-lg-1">WED</th>
							<th class="col-lg-1">THU</th>
							<th class="col-lg-1">FRI</th>
							<th class="col-lg-1">SAT</th>
						</tr>
						<tr>
							<c:forEach var="i" begin="1" end="${calendarMap.totalTd }" step="1">
								<c:set var="d" value="${i - calendarMap.beginBlank }"></c:set>
								<c:if test="${i % 7 == 1 }">
									<td style="color:red">
								</c:if>
								<c:if test="${!(i % 7 == 1)}">
									<td>
								</c:if>
									<c:if test="${d < 1 || d > calendarMap.lastDate}">
										&nbsp;
									</c:if>
									<c:if test="${!(d < 1 || d > calendarMap.lastDate)}">
										${d }
										<div align="center" class="d-grid gap-1">
											<a href="${pageContext.request.contextPath }/scheduleOne?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth + 1}&targetDate=${d}" class="btn btn-outline-success btn-block" style="height:40px">
												<c:forEach var="s" items="${scheduleList}">
													<c:if test="${s.scheduleDay == d }">
														<span data-bs-toggle="tooltip" title="${s.memo }">일정 : ${s.cnt }</span>
													</c:if>
												</c:forEach>
											</a>
										</div>
									</c:if>
									</td>
								<c:if test="${i < calendarMap.totalTd && i % 7 == 0}">
									</tr><tr>	
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</div>
			</div>
			<!-- 캘린더 -->
		</div>
	</div>
</body>
</html>