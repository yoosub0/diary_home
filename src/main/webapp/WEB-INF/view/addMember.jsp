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
        <h1 class="text-center mb-4">회원가입</h1>
        <form id="addMember" method="post" action="${pageContext.request.contextPath}/addMember">
            <table class="table table-bordered">
                <tr>
                    <th>아이디</th>
                    <td><input type="text" class="form-control" id="memberId" name="memberId" required></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" class="form-control" id="memberPw" name="memberPw" required></td>
                </tr>
                <tr>
                    <th>계정 레벨</th>
                    <td>
                        <select class="form-control" name="memberLevel" required>
                            <option value="0">회원</option>
                            <option value="1">관리자</option>
                        </select>
                    </td>
                </tr>
            </table>
            <button class="btn btn-primary" id="addMemberBtn" type="submit">가입하기</button>
        </form>
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
