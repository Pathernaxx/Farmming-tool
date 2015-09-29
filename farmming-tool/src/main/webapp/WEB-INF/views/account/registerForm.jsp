<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/farmingtool/resources/styles/account.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="//cdn.poesis.kr/post/popup.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#post_button").postcodifyPopUp();
		
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
					url : 'idcheck.action',
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
			} else if( $( "input[name='name']").val() == "" ) {
				alert("이름을 입력해주세요.");
				$( "input[name='name']").focus();
				return false;
			} else if( $( "input[name='password1']" ).val() == "" ) {
				alert( "비밀번호를 입력 해주세요." );
				$( "input[name='password1']" ).focus();
				return false;
			} else if( $( "input[name='password1']" ).val() != $( "input[name='password2']" ).val() ) {
				alert("비밀번호를 다시 확인 해주세요.");
				$( "input[name='password2']" ).focus();
				return false;
			} else if( $( "input[name=address1]").val() == "" || $( "input[name=address2]").val() == "") {
				alert("주소를 입력해주세요.");
				$("input[name=address2]").focus();
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
			} else if( $( "input[name=mobilePhone1]" ).val() == "" || $( "input[name=mobilePhone2]" ).val() == "" || $( "input[name=mobilePhone3]" ).val() == "" ) {
				alert("휴대폰 번호를 입력 해주세요.");
				$( "input[name=mobilePhone2]" ).focus();
				return false;
			} else if( $( "input[name=email1]" ).val() == "" || $( "input[name=email2]" ).val() == "" ) {
				alert("이메일을 입력 해주세요.");
				$( "input[name=email1]" ).focus();
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

	<form id="registbox" method="post" action="registerMember.action" >
		<label for="id">* 아이디</label>
		<input type="text" id="loginid" name="loginid" class="id" value title="회원 아이디" maxlength="20" />
		<a href="javascript:;" id="idcheck" name="idcheck">아이디 중복검색</a>
		<br />
		<label for="password1">* 비밀번호</label>
		<input type="password" id="password1" name="password1" class="password1" value maxlength="20" />
		<br />
		<label for="password2">* 비밀번호 확인</label>
		<input type="password" id="password2" name="password2" class="password2" value maxlength="20" />
		<br />
		<label for="name">* 이름</label>
		<input type="text" id="name" name="name" class="name" value />
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
		<br />
		<label for="phone2">* 휴대폰</label>
		<span id="phone2">
			<select id="mobilePhone1" class="input_drop" name="mobilePhone1" title="휴대폰 국번">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>&nbsp;-&nbsp;
			<input type="text" id="mobilePhone2" name="mobilePhone2" class="phone2" value maxlength="4" title="전화번호 앞자리"/>&nbsp;-&nbsp;
			<input type="text" id="mobilePhone3" name="mobilePhone3" class="phone2" value maxlength="4" title="전화번호 뒷자리"/>
		</span>
		<br />
		<label for="postcode" >우편번호</label>
		<input type="text" id="postcode" name="postcode" class="postcodify_postcode6" value readonly="readonly"/>
		<a href="javascript:;" id="post_button" class="post_button">검색</a>
		<br />
		<label for="address_input1">* 도로명 주소</label>
		<input type="text" id="address_input1" name="address1" class="postcodify_address" value readonly="readonly" />
		<br />
		<label for="address_input2">상세 주소</label>
		<input type="text" id="address_input2" name="address2" class="postcodify_details" value />
		<input type="hidden" id="extra_info" name="extra_info" class="postcodify_extra_info">
		<br />
	</form>
	<div>
		<a href="javascript:;" id="doSubmit">정보입력</a>
	</div>
</body>
</html>