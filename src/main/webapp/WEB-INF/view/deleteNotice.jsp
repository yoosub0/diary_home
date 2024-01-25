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
        <h1 class="text-center mb-4">공지사항 삭제</h1>
        <form id="deleteNotice" method="post" action="${pageContext.request.contextPath}/deleteNotice">
            <table class="table table-bordered">
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" class="form-control" id="noticePw" name="noticePw" required></td>
                </tr>
            </table>
            <input type="hidden" name="noticeNo" value="${notice.getNoticeNo()}">
            <button class="btn btn-danger" id="deleteBtn" type="submit">삭제</button>
        </form>
    </div>

    <!-- Add Bootstrap JS and Popper.js links (required for some Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
