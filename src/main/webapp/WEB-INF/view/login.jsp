<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <!-- Include Bootstrap CSS from a CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 100px;
        }
        .login-form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
        }
        .login-form h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }

        .btn-primary {
            width: 100%;
        }

        .signup-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-form">
            <h1>로그인 페이지</h1>
            <form id="login" method="post" action="${pageContext.request.contextPath}/login">
                <div class="form-group">
                    <label for="memberId">아이디</label>
                    <input type="text" class="form-control" id="memberId" name="memberId" required>
                </div>
                <div class="form-group">
                    <label for="memberPw">비밀번호</label>
                    <input type="password" class="form-control" id="memberPw" name="memberPw" required>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </form>
            <a href="${pageContext.request.contextPath}/addMember" class="signup-link">회원가입</a>
        </div>
    </div>

    <!-- Include Bootstrap JS and jQuery (required for Bootstrap JS) from a CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
