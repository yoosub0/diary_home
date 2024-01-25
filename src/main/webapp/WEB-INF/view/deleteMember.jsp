<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원 삭제</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">
    <div class="container">
        <h1 class="text-center mb-4">회원 삭제</h1>
        <form id="deleteMember" method="post" action="${pageContext.request.contextPath}/deleteMember">
            <input type="hidden" name="memberNo" value="${memberNo}">
            <table class="table table-bordered">
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" class="form-control" id="memberPw" name="memberPw" required></td>
                </tr>
            </table>
            <button class="btn btn-danger" id="deleteBtn" type="submit">삭제</button>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/home">홈으로</a>
        </form>
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
