<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<title>로그인</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#login').click(function() {
			if( $('#loginid').val() == '')
			{
				alert('아이디를 입력해주세요.');
				$('#loginid').focus();
				return false;
			} else if( $('#password').val() == '')
			{
				alert('패스워드를 입력해주세요.');
				$('#password').focus();
				return false;
			}
			
			$.ajax({
				url : '/farmingtool/account/login.action',
				async : false,
				type : 'post',
				data : {
					id : $('#loginid').val(),
					password : $('#password').val()
				},
				success : function(result) {
					if( result == "id")
					{
						alert('아이디를 다시 확인해주세요.');
						$('#loginid').focus();
						return;
					}
					else if( result == "password")
					{
						alert('패스워드를 다시 확인해주세요.');
						$('#password').focus();
						return;
					}
					else if( result == "SUCCESS" )
					{
						var returnurl = '${returnurl}';
						
						// returnurl이 없다면 홈으로
						if( returnurl == '' || returnurl.length == 0 )
							returnurl = '/farmingtool/home.jsp';
						
						$(location).attr('href', returnurl);
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<section class="section-background-blue section-home-login">
		<div class="section-wrapper">
			<div class="text-center">
				<h1>Welcome back to FarmingTool!</h1>
			</div>
			<div class="wrapper-signup login-form">
				<input type="hidden" name="returnurl" value="${ returnurl != '' || returnurl ne null ? returnurl : '' }"/>
				<input type="text" name="loginid" id="loginid" tabindex="1" placeholder="아이디">
				<input type="password" name="password" id="password" tabindex="2" placeholder="비밀번호">
				<input id="login" type="button" tabindex="3" value="로그인">
			</div>
		</div>
		<div>
			<a href="/farmingtool/account/registerMember.action">회원가입</a>
		</div>
	</section>
</body>
</html>