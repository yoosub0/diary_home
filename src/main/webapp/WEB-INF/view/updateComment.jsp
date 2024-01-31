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
        <h1 class="mb-4">공지사항 댓글 수정</h1>

        <form id="updateNotice" method="post" action="${pageContext.request.contextPath}/updateComment">
            <div class="form-group row">
					<table class="table ">
						<tr align="center">
							<th>코멘트</th>
							<td>
								<textarea name="commentContent" cols="50" id="commentContent">${originComment.commentContent}</textarea>
							</td>
						</tr>
						<tr align="center">
							<th>공개 여부</th>
							<td>
								<select name="isSecret">
									<option value="false">공개글
									<option value="true">비밀글
								</select>
							</td>
						</tr>
					</table>
					<input type="hidden" name="commentNo" value="${originComment.commentNo }">
					<input type="hidden" name="noticeNo" value="${originComment.noticeNo }">
                <div>
                    <button id="updateBtn" type="submit" class="btn btn-primary">수정</button>
              
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
