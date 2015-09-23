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
    <!-- <script src="/farmingtool/resources/js/rentallist.js"></script> -->
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
	$("#location1").click(function(){
		selected1 = $("#location1 option:selected").val();
		selected2 = searchForm.location2;
		if(selected1 == "" || selected1 == null) {
			selected2.length = 1;
			selected2.options[0].text = '지역선택2-시/군/구';
		}
		if(selected1 == "강원도") {
			selected2.length = 5;
			selected2.options[0].text = '지역선택2-시/군/구';
			selected2.options[1].text = '횡성군';
			selected2.options[2].text = '영월군';
			selected2.options[3].text = '평창군';
			selected2.options[4].text = '정선군';
			selected2.options[1].value = '횡성군';
			selected2.options[2].value = '영월군';
			selected2.options[3].value = '평창군';
			selected2.options[4].value = '정선군';
		}
		if(selected1 == "경기도") {
			selected2.length = 5;
			selected2.options[0].text = '지역선택2-시/군/구';
			selected2.options[1].text = '파주시';
			selected2.options[2].text = '수원시';
			selected2.options[3].text = '수원시 권선구';
			selected2.options[4].text = '수원시 팔달구';
			selected2.options[1].value = '파주시';
			selected2.options[2].value = '수원시';
			selected2.options[3].value = '수원시 권선구';
			selected2.options[4].value = '수원시 팔달구';
		}
		selected2.options[0].selected = true;
	});
	
	$("#location2").click(function(){
		selected1 = $("#location1 option:selected").val();
		selected2 = $("#location2 option:selected").val();
		if(selected2 == "" || selected2 == null){
			return;
		}
		$.ajax({
			url : "/farmingtool/rental/searchmachinebylocation.action",
			async : true,
			method : "POST",
			data : {
				location2 : selected2
			},
			success : function(result) {
				if (!result) {
					alert('입력 실패!');
					console.log(data);
				} else { 
					alert('입력 성공!');
					var sel = $(result.substr(result.indexOf("<select")));
					$('.rental_option2').css("display", "none");
					$( "#rental-condition-title2" ).append(sel);
					/* $("#machine1 option.eq('')").attr("selected", "selected");
					$("#machine1").click(function(){
						selected1 = $("#machine1 option:selected").val();
						if(selected1 == null || selected1 ==""){
							return;
						}
						if(selected1 != null){
							$(farmMachineListByLocation)
							$('#machine2 option[class!='+selected1+']').css("display","none");
							$('#machine2 option[class='+selected1+']').css("display","block");
						}
					}); */
				}
			},
			error : function(xhr, status, error) {
				alert('입력이 에러');
			}
		});//ajax
	});
	
	$("#machine1").click(function(){
		selected1 = $("#machine1 option:selected").val();
		if(selected1 == null || selected1 ==""){
			return;
		}
		if(selected1 != null){
			$('#machine2 option[class!='+selected1+']').css("display","none");
			$('#machine2 option[class='+selected1+']').css("display","block");
		}
	});
	
	$('#search').click(function(){
		alert("검색");
		var form = $('.searchForm').serialize();
		$.ajax({
			url : "/farmingtool/rental/searchmachine.action",
			async : true,
			method : "POST",
			data : form,
			success : function(result) {
				if (!result) {
					alert('입력 실패!');
					console.log(data);
				} else { 
					alert('입력 성공!');
					
				}
			},
			error : function(xhr, status, error) {
				alert('입력이 에러');
			}
		});//ajax
		
	});
	
});

</script>
</head>
<body>
<%-- <c:set var="farmMachineList" value="${farmMachineList }"/>
<c:set var="type" value="${type}"/> --%>
        <div id="page-wrapper">
          <div class="row">
			<form id="searchForm" >
				<h2 id="rental-condition-title1">지역선택</h2>
				<select id="location1" name="location1" class="rental_option">
					<option value="" selected="selected">지역선택1-도/시</option>
					<option value="강원도">강원도</option>
					<option value="경기도">경기도</option>
					<!-- <option value="">경상남도</option>
					<option value="">경상북도</option>
					<option value="">광주광역시</option>
					<option value="">대구광역시</option>
					<option value="">대전광역시</option>
					<option value="">부산광역시</option>
					<option value="">서울특별시</option>
					<option value="">세종특별자치시</option>
					<option value="">울산광역시</option>
					<option value="">인천광역시</option>
					<option value="">전라남도</option>
					<option value="">전라북도</option>
					<option value="">제주특별자치도</option>
					<option value="">충청남도</option>
					<option value="">충청북도</option> -->
				</select> &nbsp;
				<select id="location2" name="location2" class="rental_option">
					<option value="" selected="selected" id="origin">지역선택2-시/군/구</option>
				</select><br/><br/>
				
				<h2 id="rental-condition-title2">기계선택</h2>
				<select id="machine1" name="machine1" class="rental_option2">
					<option value="" selected="selected">기계선택1-대분류</option>
					<c:forEach var="type" items="${types}" >
						<option value="${type.typeNo}">${type.typeName}</option>
					</c:forEach>
				</select> &nbsp;
				<select id="machine2" class="rental_option2">
					<option value="" selected="selected">기계선택2-소분류</option>
					<c:forEach var="farmMachine" items="${farmMachineList}" >
						<option value="${farmMachine.fmNo}" class="${farmMachine.typeNo}" style="display: none">${farmMachine.fmName}</option>
					</c:forEach>
				</select> &nbsp;
				<input type="button" id="search" value="검색" /> <br/><br/>
			</form>
			
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