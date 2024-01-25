<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">공지사항 수정</h1>

        <form id="addComment" method="post" action="${pageContext.request.contextPath}/addComment">
			<input type="hidden" id="noticeNo" name="noticeNo" value="${resultNotice.noticeNo}">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${resultNotice.noticeTitle}" disabled>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">공지사항 내용</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="noticeContent" name="noticeContent" rows="10" cols="100" disabled>${resultNotice.noticeContent}</textarea>
                </div>
            </div>

         <div class="form-group">
            <label for="comment">댓글</label>
            <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
        </div>
        
            </div>

            <div class="form-group row">
                <div class="col-sm-10 offset-sm-2">
                    <button id="updateBtn" type="submit" class="btn btn-primary">작성</button>
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
