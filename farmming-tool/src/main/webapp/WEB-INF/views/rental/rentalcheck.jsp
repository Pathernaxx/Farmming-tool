<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FARM MACHINE</title>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
 
    <link rel='Stylesheet' href='/farmingtool/resources/styles/rentalmain.css' />
    <script src="/farmingtool/resources/js/rentallist.js"></script>
    <!-- <script src="/farmingtool/resources/js/address.js"></script> -->
<style>
.item {
    width: 200px;
    height: 250px;
    border: 3px solid;
    margin: 5px;
    float: left;
 }
</style>

<script type="text/javascript">
$(document).ready(function (){
	
	
});

</script>
</head>
<body>
<%-- <c:set var="farmMachineList" value="${farmMachineList }"/>
<c:set var="type" value="${type}"/> --%>
        <div id="page-wrapper">
          <div class="row">
			
			<h2 id="rental-condition-title1">지역선택</h2>
			<select id="location1" name="location1" class="rental_option">
				<option value="" selected="selected">지역선택1-도/시</option>
				<option value="1">강원도</option>
				<option value="2">경기도</option>
				<option value="3">경상남도</option>
				<option value="4">경상북도</option>
				<option value="5">광주광역시</option>
				<option value="6">대구광역시</option>
				<option value="7">대전광역시</option>
				<option value="8">부산광역시</option>
				<option value="9">서울특별시</option>
				<option value="10">세종특별자치시</option>
				<option value="11">울산광역시</option>
				<option value="12">인천광역시</option>
				<option value="13">전라남도</option>
				<option value="14">전라북도</option>
				<option value="15">제주특별자치도</option>
				<option value="16">충청남도</option>
				<option value="17">충청북도</option>
			</select> &nbsp;
			<div id="ac">
				<select id="location2" name="location2" class="rental_option">
					<option value="" selected="selected" id="origin">지역선택2-시/군/구</option>
				</select><br/><br/>
			</div>
		
			<h2 class="rental-condition-title2">기계선택</h2>
			<div id="ac2">
				<select id="machine1" name="machine1" class="rental_option2">
					<option value="" selected="selected">기계선택1-대분류</option>
					<c:forEach var="type" items="${types}" >
						<option value="${type.typeNo}">${type.typeName}</option>
					</c:forEach>
				</select> &nbsp;
				<select id="machine2" class="rental_option2">
					<option value="" class="basic_type" selected="selected">기계선택2-소분류</option>
					<c:forEach var="farmMachine" items="${farmMachineList}" >
						<option value="${farmMachine.fmNo}" class="${farmMachine.typeNo}" style="display: none">${farmMachine.fmName}</option>
					</c:forEach>
				</select> &nbsp;
			</div>
			<input type="button" id="search" value="검색" /> <br/><br/>
			
			<h4 id="rental-condition-title" style="font-weight: bold;color:#006699">대여시 안내사항 및 주의사항</h4>
			
			<div id="message">
				&nbsp;■ 대여가격 : <br/>
				&nbsp;■ 대여일 / 반납일 : <br/>
				&nbsp;■ 주의 사항 : <br/>
				&nbsp;<font style='color:red;font-weight: bold;'>※ 교육을 이수하지 않을 시 예약이 취소될 수 있습니다. ※</font>
			</div>
			
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
        <!-- /#page-wrapper -->

</body>
</html>