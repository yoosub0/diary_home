<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@600&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&amp;display=swap" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#idCkBtn').click(function(){
			$.ajax({
				url:'/diary/idCk',
				method:'post',
				data:{'idCk' : $('#idCk').val()},
				success:function(json){
					if(json == 0){
						$('#idCkResult').css('color', 'blue').text('아이디 사용가능');
						$('#memberId').val($('#idCk').val())
					}else{
						$('#idCkResult').css('color', 'red').text('아이디 사용불가')
						$('#memberId').val('')
						$('#idCk').val('')
					}
				},
				error:function(err){
					console.log(err)
				}
			})
		})
		
		$('#btn').click(function(){
			if($('#memberId').val().length < 1){
				alert('아이디 중복체크 미통과')
			}else if($('#memberPw').val().length < 1){
				alert('비밀번호를 입력하세요')
			}else{
				$('#form').submit()
			}
		})
	})
</script>
<style>
        body {
            background-color: #f8f9fa;
        }

        .insert-form {
            max-width: 600px;
			margin-top: 100px;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
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
<body>
    	<div class="container insert-form krFont">
        <h1 class="text-center mb-4">회원가입</h1>

            <table class="table table-bordered">
                <tr>
                    <th>아이디</th>
                    <td><input type="text" class="form-control" id="idCk" name="idCk"></td>
                    <td><button id="idCkBtn" class="btn btn-outline-dark">중복체크</button></td>
                </tr>
               <form id="form" method="post" action="${pageContext.request.contextPath}/addMember">
        	   <input type="hidden" name="memberId" id="memberId">
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" class="form-control" id="memberPw" name="memberPw"></td>
                	<td><span id="idCkResult" style="float:right"></span></td>
                </tr>
                <tr>
                    <th>계정 레벨</th>
                    <td>
                        <select class="form-control" name="memberLevel">
                            <option value="0">회원</option>
                            <option value="1">관리자</option>
                        </select>
                    </td>
                </tr>
              </form>
            </table>

            <button class="btn btn-outline-primary" id="btn" type="submit">가입하기</button>
            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/login">이전으로</a>  	
    </div>
</body>
</html>
