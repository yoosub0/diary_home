<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@600&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&amp;display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
<body>
    <div class="container krFont">
        <div class="login-form">
            <h1>로그인 페이지</h1>
            <form id="login" method="post" action="${pageContext.request.contextPath}/login">
                <div class="form-group">
                    <label for="memberId">아이디</label>
                    <input type="text" class="form-control" id="memberId" name="memberId" value="admin" required>
                </div>
                <div class="form-group">
                    <label for="memberPw">비밀번호</label>
                    <input type="password" class="form-control" id="memberPw" name="memberPw" value="1234" required>
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
