<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
   <br>
   <div class="container mt-3 center krFont">
      <a class="btn btn-outline-success" href="${pageContext.request.contextPath}/noticeList">공지사항</a>
      <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/updateMemberPw?memberNo=${loginMember.memberNo}">정보수정</a>
      <a class="btn btn-outline-warning" href="${pageContext.request.contextPath}/deleteMember?memberNo=${loginMember.memberNo}">회원탈퇴</a>    
      <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/logout">로그아웃</a> 
   </div>
   <br>
   
   <table class="container center krFont">
   	  <tbody>
   		<tr>
   		  <td>
   		    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth - 1}">이전달</a>
   		  </td>
   		  <td>
   		  	<h3>${calendarMap.targetYear} 년 ${calendarMap.targetMonth + 1} 월 </h3>
   		  </td>
   		  <td>
      		<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/home?targetYear=${calendarMap.targetYear}&targetMonth=${calendarMap.targetMonth + 1}">다음달</a>
   		  </td>
   		 </tr>
   	</tbody>
   </table>
   
   <div>

   </div>
   <div>
   </div>
   
   <table class="table table-bordered krFont">
   		<tr class="text-center">
   		<th>일요일</th>
   		<th>월요일</th>
   		<th>화요일</th>
   		<th>수요일</th>
   		<th>목요일</th>
   		<th>금요일</th>
   		<th>토요일</th>
   		</tr>
      <tr>
         <c:forEach var="i" begin="1" end="${calendarMap.totalTd}">
            <c:set var="d" value="${i - calendarMap.beginBlank}"></c:set>
            <td>
               <c:if test="${d < 1 || d > calendarMap.lastDate}">
                  &nbsp;
               </c:if>
               <c:if test="${!(d < 1 || d > calendarMap.lastDate)}">
                  <c:if test="${(i%7-1)==0}">
                     <a href="${pageContext.request.contextPath}/scheduleByDay?Year=${calendarMap.targetYear}&Month=${calendarMap.targetMonth + 1}&Day=${d}" class="text-danger">${d}</a>
                     <div>
                   <c:forEach var="m" items="${list}">
                             <c:if test="${m.scheduleDay == d}">
                                 <div>${m.scheduleEmoji}</div>
                                <div>
								    <c:choose>
								        <c:when test="${m.cnt == 1}">
								            <span class="badge bg-primary">${m.cnt} 개의 일정</span>
								        </c:when>
								        <c:when test="${m.cnt > 1 && m.cnt <= 2}">
								            <span class="badge bg-success">${m.cnt} 개의 일정</span>
								        </c:when>
								        <c:when test="${m.cnt > 2}">
								            <span class="badge bg-danger">${m.cnt} 개의 일정</span>
								        </c:when>
								    </c:choose>
								</div>

                                 <div>${m.memo}</div>
                              </c:if>
                        </c:forEach>
                     </div>
                  </c:if>
                  <c:if test="${!((i%7-1)==0)}">
                      <a href="${pageContext.request.contextPath}/scheduleByDay?Year=${calendarMap.targetYear}&Month=${calendarMap.targetMonth + 1}&Day=${d}">
                         ${d}
                      </a>
                        <div>
                   		   <c:forEach var="m" items="${list}">
                              <c:if test="${m.scheduleDay == d}">
                                 <div>${m.scheduleEmoji}</div>
                                <div>
								    <c:choose>
								        <c:when test="${m.cnt == 1}">
								            <span class="badge bg-primary">${m.cnt} 개의 일정</span>
								        </c:when>
								        <c:when test="${m.cnt > 1 && m.cnt <= 2}">
								            <span class="badge bg-success">${m.cnt} 개의 일정</span>
								        </c:when>
								        <c:when test="${m.cnt > 2}">
								            <span class="badge bg-danger">${m.cnt} 개의 일정</span>
								        </c:when>
								    </c:choose>
								</div>

                                 <div>${m.memo}</div>
                              </c:if>
                           </c:forEach> 
                        </div>
                  </c:if>
               </c:if>
               
               <!-- 한행에 7열씩.. -->
               <c:if test="${i < calendarMap.totalTd && i%7 == 0}">
                  </tr><tr>
               </c:if>
            </td>
         </c:forEach>
      </tr>
      
   </table>
   </div>
</body>
</html>