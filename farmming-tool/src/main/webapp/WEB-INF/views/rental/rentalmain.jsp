<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>rental main page</title>
<link rel='Stylesheet' href='/farmingtool/resources/styles/default.css' />
<link rel='Stylesheet' href='/farmingtool/resources/styles/rentalmain.css' />
<script type="text/javascript" src="/farmingtool/resources/js/address.jsp"></script><!-- 주소 데이터 저장 jsp -->
<script type="text/javascript">

</script>

</head>

<body>
<div id="pageContainer">
	
	<!-- header -->
	<%pageContext.include("/WEB-INF/views/include/header.jsp");%>
	
	<!-- contents -->
	<div id="inputcontent">
	
		<div id="rental-condition">
			<br/><br/>
			<h1 style="background-color: #FEFFFF; color: #666666;">농기계 대여 예약</h1><hr/><br/>
			
			<form name = "frm1">
				<h2 id="rental-condition-title">지역선택</h2>
				<select id="rental-option" name="locationBig" onchange="sub_change1()">
					<option value="" selected="selected">지역선택1-도/시</option>
					<option value="강원도">강원도</option>
					<option value="경기도">경기도</option>
					<option value="강원도">경상남도</option>
					<option value="강원도">경상북도</option>
					<option value="강원도">광주광역시</option>
					<option value="강원도">대구광역시</option>
					<option value="강원도">대전광역시</option>
					<option value="강원도">부산광역시</option>
					<option value="강원도">서울특별시</option>
					<option value="강원도">세종특별자치시</option>
					<option value="강원도">울산광역시</option>
					<option value="강원도">인천광역시</option>
					<option value="강원도">전라남도</option>
					<option value="강원도">전라북도</option>
					<option value="강원도">제주특별자치도</option>
					<option value="강원도">충청남도</option>
					<option value="강원도">충청북도</option>
				</select> &nbsp;
				<select id="rental-option" name="locationSmall"><!--  onchange="sub_change2() -->
					<option value="" selected="selected">지역선택2-시/군/구</option>
				</select><br/><br/>
			</form>	
			
			<form name = "frm2">
				<h2 id="rental-condition-title">기계선택</h2>
				<select id="rental-option" name="tool-big">
					<option value="" selected="selected">기계선택1-대분류</option>
					<option value="트랙터 및 부속품">트랙터 및 부속품</option>
				</select> &nbsp;
				<select id="rental-option" name="tool-small">
					<option value="" selected="selected">기계선택2-소분류</option>
					<option value="농용트랙터">농용트랙터</option>
				</select> &nbsp; <input type="button" id="search" name="search" value="검색" onclick=""/> <br/><br/>
			</form>
			
			<h4 id="rental-condition-title" style="font-weight: bold;color:#006699">대여시 안내사항 및 주의사항</h4>
			
			<div id="message">
				&nbsp;■ 대여가격 : <br/>
				&nbsp;■ 대여일 / 반납일 : <br/>
				&nbsp;■ 주의 사항 : <br/>
				&nbsp;<font style='color:red;font-weight: bold;'>※ 교육을 이수하지 않을 시 예약이 취소될 수 있습니다. ※</font>
			</div>
		</div>
		<br/><br/>
		
		<div id="rental-calendar">
		달력<br/><br/><br/>
		</div>
	
		<div>
			<input type="button" id="reservation" name="reservation" value="예약" 
				onclick="location.href='/farmingtool/rental/rentalCheck.action'"/>
				<!-- jquery를 통해 예약확인창 만들기 -->
		</div>		
	</div>
	
</div>
</body>

</html>













