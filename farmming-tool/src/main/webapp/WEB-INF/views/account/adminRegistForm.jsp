<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADMIN 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#idcheck").click(function(event) {
			if($("input[name='loginid']").val() == "")
			{
				alert("아이디 입력 후 중복 체크 해주세요.");
				$("input[name='loginid']").focus();
				return false;
			}
			else
			{
				var loginid = $("input[name='loginid']").val();
				$.ajax({
					url : 'adminIdcheck.action',
					async : false,
					data : { 
						'id' : loginid 
					},
					success : function(result) {
						if(result == "good")
						{
							alert("사용 가능한 아이디입니다.");
						}
						else
						{
							alert("중복 된 아이디입니다.");
							$("input[name='loginid']").focus();
						}
					}
				});
			}	
			event.preventDefault();
		});
		
		$('#doSubmit').click(function(event) {
			if( $( "input[name='loginid']" ).val() == "" ) {
				alert( "아이디 입력후 중복 체크 해주세요." );
				$( "input[name='loginid']" ).focus();
				return false;
			} else if( $( "input[name='password1']" ).val() == "" ) {
				alert( "비밀번호를 입력 해주세요." );
				$( "input[name='password1']" ).focus();
				return false;
			} else if( $( "input[name='password1']" ).val() != $( "input[name='password2']" ).val() ) {
				alert("비밀번호를 다시 확인 해주세요.");
				$( "input[name='password2']" ).focus();
				return false;
			} else if( $( "input[name='name']").val() == "" ) {
				alert("담당자 이름을 입력해주세요.");
				$( "input[name='name']").focus();
				return false;
			}

			// 비밀번호
			var UserID 			= document.getElementById('loginid').value;
			var UserPassWord 	= document.getElementById('password1').value;
			var UserPassWordRe 	= document.getElementById('password2').value;

			var chkPwd = CheckPassWord(UserID, UserPassWord, UserPassWordRe);
			
			if (!chkPwd) {	
				document.getElementById('password1').focus();
				return false;
			} else if( $( "input[name=phoneNo1]" ).val() == "" || $( "input[name=phoneNo2]" ).val() == "" || $( "input[name=phoneNo3]" ).val() == "" ) {
				alert("휴대폰 번호를 입력 해주세요.");
				$( "input[name=mobilePhone2]" ).focus();
				return false;
			}
			
			function CheckPassWord(ObjUserID, ObjUserPassWord, objUserPassWordRe) 
			{
			    if(ObjUserPassWord != objUserPassWordRe) {
			        alert("입력하신 비밀번호와 비밀번호확인이 일치하지 않습니다");
			        return false;
			    }
		
			    var chk_num = ObjUserPassWord.search(/[0-9]/g); 
			    var chk_eng = ObjUserPassWord.search(/[a-z]/ig); 
			    var chk_special = ObjUserPassWord.search(/[`~!@#$%^&*\|()+,.<=>\{\}_\'\";:\/?]/gi); 
			    
			   if(ObjUserPassWord.length<8) {
			        alert("비밀번호는 문자, 숫자, 특수문자의 조합으로 8~20자리로 입력 해주세요..");
			        return false;
			    }
		
			    if(chk_num < 0 || chk_eng < 0 || chk_special < 0){ 
			        alert("비밀번호는 문자, 숫자, 특수문자의 조합으로 8~20자리로 입력 해주세요.");
			        return false;
			    }
		
			    if(ObjUserPassWord.indexOf(ObjUserID) > -1) {
			        alert("비밀번호에 아이디를 사용할 수 없습니다.");
			        return false;
			    }
			   
			    var SamePass_0 = 0; //동일문자 카운트
			    var SamePass_1 = 0; //연속성(+) 카운드
			    var SamePass_2 = 0; //연속성(-) 카운드
			   
			    var chr_pass_0;
			    var chr_pass_1;
			    var chr_pass_2;
			    
			    for(var i=0; i < ObjUserPassWord.length; i++) {
			        chr_pass_0 = ObjUserPassWord.charAt(i);
			        chr_pass_1 = ObjUserPassWord.charAt(i+1);
			        chr_pass_2 = ObjUserPassWord.charAt(i+2);
			        
			        //동일문자 카운트
			        if(chr_pass_0 == chr_pass_1 && chr_pass_1 == chr_pass_2) {
			            SamePass_0 = SamePass_0 + 1;
			        }
			        
			        //연속성(+) 카운드
			        if(chr_pass_0.charCodeAt(0) == chr_pass_1.charCodeAt(0)-1 && chr_pass_1.charCodeAt(0) == chr_pass_2.charCodeAt(0)-1) {
			            SamePass_1 = SamePass_1 + 1;
			        }
			       
			        //연속성(-) 카운드
			        if(chr_pass_0.charCodeAt(0) == chr_pass_1.charCodeAt(0)+1 && chr_pass_1.charCodeAt(0) == chr_pass_2.charCodeAt(0)+1) {
			            SamePass_2 = SamePass_2 + 1;
			        }
			    }
			    if(SamePass_0 > 0) {
			        alert("비밀번호에 동일문자를 3번 이상 사용할 수 없습니다.");
			        return false;
			    }
			  
			    if(SamePass_1 > 0 || SamePass_2 > 0 ) {
			        alert("비밀번호에 연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.");
			        return false;
			    }
		
				return true;
			}
			
			$('#registbox').serialize();
			$('#registbox').submit();
			
			event.preventDefault();
		});
	});
</script>
</head>
<body>
	<form id="registbox" method="post" action="registerAdmin.action">
		<label for="loginid">아이디</label>
		<input type="text" id="loginid" name="loginid" maxLength="20">
		<a href="javascript:;" id="idcheck">아이디 체크</a>
		<br />
		<label for="name">이름</label>
		<input type="text" id="name" name="name" maxLength="10" />
		<br />
		<label for="password1">비밀번호</label>
		<input type="password" id="password1" name="password1" maxLength="20" />
		<br />
		<label for="password2">비밀번호 확인</label>
		<input type="password" id="password2" name="password2" maxLength="20" />
		<br />
		<label for="location1Select">담당 지역</label>
		<span id="location1Select">
			<select id="location1" name="location1" >
				<c:forEach var="location1" items="${ locations1 }">
					<option id="${ location1.locationName1 }">${ location1.locationName1 }</option>
				</c:forEach>
			</select>
			<select id="location2" name="location2" >
				<c:forEach var="location2" items="${ locations2 }">
					<option id="${ location2.locationName2 }">${ location2.locationName2 }</option>
				</c:forEach>
			</select>
		</span>
		<br />
		<label for="phone1">전화번호</label>
		<span id="phone1">
			<select id="phoneNo1" class="input_drop" name="phoneNo1" title="국번">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>
				<option value="033">033</option>
				<option value="041">041</option>
				<option value="042">042</option>
				<option value="043">043</option>
				<option value="051">051</option>
				<option value="052">052</option>
				<option value="053">053</option>
				<option value="054">054</option>
				<option value="055">055</option>
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>
				<option value="064">064</option>
				<option value="070">070</option>
			</select>&nbsp;-&nbsp;
			<input type="text" id="phoneNo2" name="phoneNo2" class="phone1" value maxlength="4" title="전화번호 앞자리"/>&nbsp;-&nbsp;
			<input type="text" id="phoneNo3" name="phoneNo3" class="phone1" value maxlength="4" title="전화번호 뒷자리"/>
		</span>
	</form>
	<div>
		<a href="javascript:;" id="doSubmit">정보 입력</a>
	</div>
</body>
</html>