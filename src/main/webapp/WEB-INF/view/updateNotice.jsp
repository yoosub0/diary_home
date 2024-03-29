<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@600&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&amp;display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<style>
        .insert-form {
            max-width: 800px;
			margin-top: 100px;
            background-color: #fff;
            text-align: center;
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
<body class="bg-light">
    <div class="container krFont insert-form">
        <h1 class="mb-4">공지사항 수정</h1>

        <form id="updateNotice" method="post" action="${pageContext.request.contextPath}/updateNotice">
			<input type="hidden" id="noticeNo" name="noticeNo" value="${resultNotice.noticeNo}">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${resultNotice.noticeTitle}">
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">공지사항 내용</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="noticeContent" name="noticeContent" rows="10" cols="100">${resultNotice.noticeContent}</textarea>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">PW</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="noticePw" name="noticePw">
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <button id="updateBtn" type="submit" class="btn btn-primary">수정</button>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
