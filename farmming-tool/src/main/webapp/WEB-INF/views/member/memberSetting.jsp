<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="//cdn.poesis.kr/post/popup.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#post_button").postcodifyPopUp();
		
		$('#doSubmit').click(function(event) {
			if( $( "input[name='password1']" ).val() == "" ) {
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

	<form id="registbox" method="post" action="updateMember.action" >
		<label for="id">* 아이디</label>
		<input type="text" id="loginid" name="loginid" class="id" value="${ member.memberId }" readonly="readonly" title="회원 아이디" maxlength="20" />
		<br />
		<label for="password1">* 비밀번호</label>
		<input type="password" id="password1" name="password1" class="password1" value maxlength="20" />
		<br />
		<label for="password2">* 비밀번호 확인</label>
		<input type="password" id="password2" name="password2" class="password2" value maxlength="20" />
		<br />
		<label for="name">* 이름</label>
		<input type="text" id="name" name="name" class="name" value="${ member.memberName }" readonly="readonly" />
		<br />
		<label for="phone1">전화번호</label>
		<span id="phone1">
			<select id="phoneNo1" class="input_drop" name="phoneNo1" title="국번">
				<option value="02" ${ phone[0] eq '02' ? 'selected' : '' }>02</option>
				<option value="031" ${ phone[0] eq '031' ? 'selected' : '' } >031</option>
				<option value="032" ${ phone[0] eq '032' ? 'selected' : '' } >032</option>
				<option value="033" ${ phone[0] eq '033' ? 'selected' : '' } >033</option>
				<option value="041" ${ phone[0] eq '041' ? 'selected' : '' } >041</option>
				<option value="042" ${ phone[0] eq '042' ? 'selected' : '' } >042</option>
				<option value="043" ${ phone[0] eq '043' ? 'selected' : '' } >043</option>
				<option value="051" ${ phone[0] eq '051' ? 'selected' : '' } >051</option>
				<option value="052" ${ phone[0] eq '052' ? 'selected' : '' } >052</option>
				<option value="053" ${ phone[0] eq '053' ? 'selected' : '' } >053</option>
				<option value="054" ${ phone[0] eq '054' ? 'selected' : '' } >054</option>
				<option value="055" ${ phone[0] eq '055' ? 'selected' : '' } >055</option>
				<option value="061" ${ phone[0] eq '061' ? 'selected' : '' } >061</option>
				<option value="062" ${ phone[0] eq '062' ? 'selected' : '' } >062</option>
				<option value="063" ${ phone[0] eq '063' ? 'selected' : '' } >063</option>
				<option value="064" ${ phone[0] eq '064' ? 'selected' : '' } >064</option>
				<option value="070" ${ phone[0] eq '070' ? 'selected' : '' } >070</option>
			</select>&nbsp;-&nbsp;
			<input type="text" id="phoneNo2" name="phoneNo2" class="phone1" value="${ phone[1] ne null : phone[1] : '' }" maxlength="4" title="전화번호 앞자리"/>&nbsp;-&nbsp;
			<input type="text" id="phoneNo3" name="phoneNo3" class="phone1" value="${ phone[2] ne null : phone[2] : '' }" maxlength="4" title="전화번호 뒷자리"/>
		</span>
		<br />
		<label for="phone2">* 휴대폰</label>
		<span id="phone2">
			<select id="mobilePhone1" class="input_drop" name="mobilePhone1" title="휴대폰 국번">
				<option value="010" ${ mobilePhone[0] eq '010' ? 'selected' : '' }>010</option>
				<option value="011" ${ mobilePhone[0] eq '011' ? 'selected' : '' }>011</option>
				<option value="016" ${ mobilePhone[0] eq '016' ? 'selected' : '' }>016</option>
				<option value="017" ${ mobilePhone[0] eq '017' ? 'selected' : '' }>017</option>
				<option value="018" ${ mobilePhone[0] eq '018' ? 'selected' : '' }>018</option>
				<option value="019" ${ mobilePhone[0] eq '019' ? 'selected' : '' }>019</option>
			</select>&nbsp;-&nbsp;
			<input type="text" id="mobilePhone2" name="mobilePhone2" class="phone2" value="${ mobilePhone[1] }" maxlength="4" title="전화번호 앞자리"/>&nbsp;-&nbsp;
			<input type="text" id="mobilePhone3" name="mobilePhone3" class="phone2" value="${ mobilePhone[2] }" maxlength="4" title="전화번호 뒷자리"/>
		</span>
		<br />
		<label for="postcode" >우편번호</label>
		<input type="text" id="postcode" name="postcode" class="postcodify_postcode6" value="${ member.memberPostCode }" readonly="readonly"/>
		<a href="javascript:;" id="post_button" class="post_button">검색</a>
		<br />
		<label for="address_input1">* 도로명 주소</label>
		<input type="text" id="address_input1" name="address1" class="postcodify_address" value="${ member.memberAddress1 }" readonly="readonly" />
		<br />
		<label for="address_input2">상세 주소</label>
		<input type="text" id="address_input2" name="address2" class="postcodify_details" value="${ member.memberAddress2 }" />
		<input type="hidden" id="extra_info" name="extra_info" class="postcodify_extra_info">
		<br />
	</form>
	<div>
		<a href="javascript:;" id="doSubmit">정보입력</a>
	</div>
</body>
</html>