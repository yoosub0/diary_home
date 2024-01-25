<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
    <title>일정 상세 정보</title>
</head>
<body class="bg-light">
    <div class="container mt-4">
        <h1>${Year}년 ${Month}월 ${Day}일 일정리스트</h1>
        <h3>${loginMember.memberId}님 일정 상세정보</h3>

        <table class="table table-bordered text-center">
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

        <h1>일정 추가</h1>
        <form id="insertSchedule" method="post" action="${pageContext.request.contextPath}/addSchedule">
            <input type="hidden" name="targetY" value="${calendarMap.targetYear}">
            <input type="hidden" name="targetM" value="${calendarMap.targetM+1}">
            <input type="hidden" name="targetD" value="${calendarMap.targetD}">
            <input type="hidden" name="memberId" value="${loginMember}">
            <div class="mb-3">
                <textarea class="form-control" rows="3" name="memo" id="memo"></textarea>
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
