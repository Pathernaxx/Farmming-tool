<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>rental main page</title>
<link rel='Stylesheet' href='/SyAcademy/styles/default.css' />
</head>

<body>
<div id="pageContainer">
	
	<!-- header -->
	<%pageContext.include("/WEB-INF/views/include/header.jsp");%>
	
	<!-- contents -->
	<div id="inputcontent">
	
		<div id="rental-condition"><br/><br/>
			지역선택<br/>
			<select name="location-big">
				<option value="" selected="selected">지역선택1-도/시</option>
				<option value="서울특별시">서울특별시</option>
			</select> &nbsp;
			<select name="location-small">
				<option value="" selected="selected">지역선택2-시/군/구</option>
				<option value="서초동">서초동</option>
			</select><br/><br/>
			기계선택<br/>
			<select name="tool-big">
				<option value="" selected="selected">기계선택1-대분류</option>
				<option value="트랙터 및 부속품">트랙터 및 부속품</option>
			</select> &nbsp;
			<select name="tool-small">
				<option value="" selected="selected">기계선택2-소분류</option>
				<option value="농용트랙터">농용트랙터</option>
			</select><br/><br/>
			<div id="message">
				대여가격, 교육이수정보 등의 안내말
			</div>
			<input type="button" name="search" value="검색" onclick=""/>
		</div><br/><br/>
		
		<div id="rental-calendar">
		달력
		</div>
		
	</div>
	
</div>
</body>

</html>













