<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport">
    <title>Insert title here</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="container">
        <h1 class="text-center mb-4">비밀번호 변경</h1>
        <form id="updateMemberPw" method="post" action="${pageContext.request.contextPath}/updateMemberPw">
        
        <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
            <table class="table table-bordered">
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
